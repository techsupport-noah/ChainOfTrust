//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import "./ownable.sol";

/**
   * @title Rating
   * @dev Base Contract for creating and editing ratings
   * @custom:dev-run-script src/conctracts/Rating.sol
   */
contract Rating is Ownable{
    
    event NewRating(uint RatingId, uint score, address ratinguser);
    event NewTrusted(address newtrusteduser, address addinguser);
    //event NewBanned(address newbanneduser, address addinguser);

    string[] private _Valid = ["Good Rating","General Scam","Bad Communication","Other"];

    struct Ratingdata {
        uint8 score;
        address ratinguser;
    }

    Ratingdata[] public ratings;

    //mapping (uint => mapping (address => address)) public ratingToOwner;
    mapping (uint => address) public ratingToOwner;
    mapping (address => mapping (address => uint)) ownerRatingCount;
    //mapping (address => bool) isAccountbanned;
    mapping (address => bool) isTrustedvar;

    /*  Checks if the rate score is valid.
        =0   -> good Score
        >0  -> bad Score
    */
    function _isScoreValid (uint8 _score) internal view returns (bool) {
        if (_score >= 0 && _score <= _Valid.length -1) 
            return true;
        return false;
    }

    /*  Display the score description
    */
    function scoreMessage (uint8 _score) public view returns (string memory) {
        if (_isScoreValid(_score)) {
            return _Valid[_score];
        }
        return "Score not found";
    }

    /*  Adds mapping and the rating for the walet
    */ 
    function _createRating(address _to, uint8 _score) private {
        ratings.push(Ratingdata(_score, msg.sender));
        uint id = ratings.length -1;
        //ratingToOwner[id][_from] = _to;
        ratingToOwner[id] = _to;
        ownerRatingCount[_to][msg.sender]++;
        _checkTrustedCondition(_to);
        emit NewRating(id, _score, msg.sender);
    }

    /*  Creates the rating for a specific transaction
        _to     -> Address of the rated Walet
        _score  -> Score for the Rating
    */
    function createNewRating(address _to, uint8 _score) public onlyTrusted{
        //you cannot rate yourself
        require(_to != msg.sender);
        require(canCreateRatings());
        //no previous rating for this transaction
        require(ownerRatingCount[_to][msg.sender] == 0); 
        //valid input
        require(_isScoreValid(_score));
        _createRating(_to, _score);
    }

    /*  adds User to a group, that can create reviews without the usual requirement
    */
    function addtrustedUser(address _user) external onlyOwner{
        isTrustedvar[_user] = true;
        emit NewTrusted(_user, msg.sender);
    }

    /*  returns reviews for user or self depending on content
            true -> count good reviews
            false -> count bad reviews
    */
    function get(address _user) public view returns (uint[4] memory){
        uint[4] memory counter;
        for (uint i=0;i<ratings.length;i++) {
            if (ratingToOwner[i] == _user) {
                Ratingdata storage myRating = ratings[i];
                uint8 _score = myRating.score;
                if (_isScoreValid(_score)) {    //TODO if ban is ever implemented again add a check for banned accounts here
                    counter[_score] += 1 ;
                }
            }
        }
        return counter;
    }

    function _checkTrustedCondition(address _user) internal{
        if(isTrustedvar[_user]){
            return;
        }
        uint counter;
        for (uint i=0;i<ratings.length;i++) {
            if (ratingToOwner[i] == _user) {
                Ratingdata storage myRating = ratings[i];
                if (_isScoreValid(myRating.score)) { //TODO if ban is ever implemented again add a check for banned accounts here
                    if (myRating.score == 0) {
                        counter++;
                        if(counter >=10){
                            isTrustedvar[_user] = true;
                            emit NewTrusted(_user, msg.sender);
                        }
                    }
                }
            }
        }
    }

    /*  deletes User from a group, that can create reviews without the usual requirement
    */
    function deltrustedUser(address _user) external onlyOwner{
        isTrustedvar[_user] = false;
    }

    function isTrusted() internal view returns(bool){
        return(isTrustedvar[msg.sender] == true);
    }

    /*  The user will be allowed to create new ratings if they have 10 or more positive ratings
        or if they are the Owner of this contract.
    */
    function canCreateRatings () public pure returns (bool){
        //TODO if ban is ever implemented again add a check for banned accounts here
        /*if(_isbanned())
            return false;*/
        return true;
    }

    modifier onlyTrusted(){
        require(isTrusted() || isOwner());
        _;
    }
}