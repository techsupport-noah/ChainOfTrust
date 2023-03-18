//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import "./RatingReader.sol";

/**
   * @title RatingCreator
   * @dev Sub Contract for creating new ratings
   */
contract RatingCreator is RatingReader {

    /*  Adds mapping and the rating for the walet
    */ 
    function _createRating(address _to, uint _score) private {
        ratings.push(Ratingdata(_score, msg.sender));
        uint id = ratings.length -1;
        //ratingToOwner[id][_from] = _to;
        ratingToOwner[id] = _to;
        ownerRatingCount[_to][msg.sender]++;
        emit NewRating(id, _score, msg.sender);
    }

    /*  The user will be allowed to create new ratings if they have 10 or more positive ratings
        or if they are the Owner of this contract.
    */
    function canCreateRatings () public view returns (bool){
        if(isOwner())
            return true;
        if(_isbanned())
            return false;
        if(isTrusted[msg.sender] == true)
            return true;
        uint positiveRatings = get(true);
        if(positiveRatings >= 10)
            return true;
        return false;
    }

    /*  Creates the rating for a specific transaction
        _to     -> Address of the rated Walet
        _score  -> Score for the Rating
    */
    function createNewRating(address _to, uint _score) public {
        require(_to != msg.sender);
        //you cannot rate yourself
        require(canCreateRatings());
        //no previous rating for this transaction
        require(ownerRatingCount[_to][msg.sender] == 0); 
        //valid input
        require(_isScoreValid(_score));
        _createRating(_to, _score);
    }
}