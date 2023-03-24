//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import "./Rating.sol";

/**
   * @title RatingCreator
   * @dev Sub Contract for creating new ratings
   */
contract RatingCreator is Rating {

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

    /*  The user will be allowed to create new ratings if they have 10 or more positive ratings
        or if they are the Owner of this contract.
    */
    function canCreateRatings () public view returns (bool){
        if(_isbanned())
            return false;
        return true;
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
}