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
    function _isScoreValid (uint _score) internal view returns (bool) {
        if (_score >= 0 && _score <= _Valid.length -1) 
            return true;
        return false;
    }

    /*  Display the score description
    */
    function scoreMessage (uint _score) public view returns (string memory) {
        if (_isScoreValid(_score)) {
            return _Valid[_score];
        }
        return "Score not found";
    }

    /*-----------------------------------------------------------------------
        Since we already have the trusted User group we wont be implementing a ban for now
     *-----------------------------------------------------------------------*/
    /*function _isbanned () internal view returns (bool){
        return isAccountbanned[msg.sender];
    }

    function _isbanned (address _user) internal view returns (bool){
        return isAccountbanned[_user];
    }*/

    /*  User will be unable to create new reviews even with requirements
    */
    /*function ban(address _user) external onlyOwner{
        isAccountbanned[_user] = true;
        emit NewBanned(_user, msg.sender);
    }

    function unban(address _user) external onlyOwner{
        isAccountbanned[_user] = false;
    }*/
    //-----------------------------------------------------------------------

    /*  adds User to a group, that can create reviews without the usual requirement
    */
    function addtrustedUser(address _user) external onlyOwner{
        isTrustedvar[_user] = true;
        emit NewTrusted(_user, msg.sender);
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

    modifier onlyTrusted(){
        require(isTrusted() || isOwner());
        _;
    }

}