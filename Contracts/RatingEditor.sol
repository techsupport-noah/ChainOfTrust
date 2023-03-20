//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import "./Rating.sol";

/**
   * @title RatingEditor
   * @dev Sub Contract for editing old ratings given by the msg.sender
   Does not Work. Do not deploy
   */
contract RatingEditor is Rating {

    function _editRating(uint _location, uint8 _score) private {
        ratings[_location].score = _score;
    }

    function _getlocation(address _ratingUser, address _ratedUser) private view returns (uint){
        for (uint128 i=0;i<ratings.length;i++) {
            if (ratingToOwner[i] == _ratedUser) {
                require(ratings[i].ratinguser == _ratingUser);
                return i;
            }
        }
        
    }

    /*  change a Rating for walet done by you
    */
    function editRating(address _to, uint8 _newscore) public {
        //no previous rating for this transaction
        require(ownerRatingCount[_to][msg.sender] == 1); 
        //valid input
        require(_isScoreValid(_newscore));
        _editRating( _getlocation(msg.sender, _to) , _newscore);
    }
    
}