pragma solidity >=0.8.19;

import "./ownable.sol";

contract Rating is Ownable{
    
    event NewRating(uint RatingId, uint score);

    string[] private _Valid = ["Gute Bewertung","Kein Grund","schlecht test 1","schlecht test 2","schlecht test 3","schlecht test 4"];

    struct Ratingdata {
        uint score;
    }

    Ratingdata[] public ratings;

    //mapping (uint => mapping (address => address)) public ratingToOwner;
    mapping (uint => address) public ratingToOwner;
    mapping (address => mapping (address => uint)) ownerRatingCount;
    mapping (address => bool) isAccountbanned;
    mapping (address => bool) isTrusted;

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

    function _isbanned () internal view returns (bool){
        if(isAccountbanned[msg.sender])
            return true;
        return false;
    }

    /*  User will be unable to create new reviews even with requirements
    */
    function ban(address _user) external onlyOwner{
        isAccountbanned[_user] = true;
    }

    function unban(address _user) external onlyOwner{
        isAccountbanned[_user] = false;
    }

    /*  adds User to a group, that can create reviews without the usual requirement
    */
    function addtrustedUser(address _user) external onlyOwner{
        isTrusted[_user] = true;
    }

    /*  deletes User from a group, that can create reviews without the usual requirement
    */
    function deltrustedUser(address _user) external onlyOwner{
        isTrusted[_user] = false;
    }

}