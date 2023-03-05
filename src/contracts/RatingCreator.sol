pragma solidity >=0.8.19;

import "./Rating.sol";

contract RatingCreator is Rating {

    /*  Adds mapping and the rating for the walet (TODO and a specific transaction)
    */ 
    function _createRating(address _from, address _to, uint _score) private {
        ratings.push(Ratingdata(_score));
        uint id = ratings.length -1;
        ratingToOwner[id] = _to;
        ownerRatingCount[_to][_from]++;
        emit NewRating(id, _score);
    }

    /*  Creates the rating for a specific transaction
    _to     -> Address of the rated Walet
    _score  -> Score for the Rating
    */
    function createNewRating(address _to, uint _score) public {
        //no previous rating for this transaction
        require(ownerRatingCount[_to][msg.sender] == 0); 
        //valid input
        require(_isScoreValid(_score));
        _createRating( msg.sender, _to, _score);
    }

}