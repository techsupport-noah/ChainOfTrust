pragma solidity >=0.8.19;

contract Rating {
    
    event NewRating(uint RatingId, uint score);

    uint[] private _Valid = [0,1,2,3,4,5];

    struct Ratingdata {
        uint score;
    }

    Ratingdata[] public ratings;

    mapping (uint => address) public ratingToOwner;
    mapping (address => mapping (address => uint)) ownerRatingCount;

    /*  Checks if the rate score is valid.
        0   -> good Score
        >0  -> bad Score
    */
    function _isScoreValid (uint _score) internal pure returns (bool) {
        if (_score == 0) 
            return true;
        return false;
    }

}