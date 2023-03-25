//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import "./Rating.sol";

/**
   * @title RatingReader
   * @dev Sub Contract for reading ratings
   */
contract RatingReader is Rating {

    /*  returns reviews for user or self depending on content
            true -> count good reviews
            false -> count bad reviews
    */
    function get(address _user) public view returns (uint[] memory){
        uint[] memory counter;
        for (uint i=0;i<ratings.length;i++) {
            if (ratingToOwner[i] == _user) {
                Ratingdata storage myRating = ratings[i];
                if (_isScoreValid(myRating.score)) {    //TODO if ban is ever implemented again add a check for banned accounts here
                    counter[myRating.score]++;
                }
            }
        }
        return counter;
    }

    /*function get(bool _case) public view returns (uint){
        uint[] memory counter;
        for (uint i=0;i<ratings.length;i++) {
            if (ratingToOwner[i] == msg.sender) {
                Ratingdata storage myRating = ratings[i];
                if (_isScoreValid(myRating.score)) {    //TODO if ban is ever implemented again add a check for banned accounts here
                    if (myRating.score == 0) {
                        counter[0]++;
                    }else {
                        counter[1]++;
                    }
                }
            }
        }
        if(_case){
            return counter[0];
        }else {
            return counter[1];
        }
    }

    function get(address _user) public view returns (uint){
        uint counter;
        for (uint i=0;i<ratings.length;i++) {
            if (ratingToOwner[i] == _user) {
                if (_isScoreValid(ratings[i].score))    //TODO if ban is ever implemented again add a check for banned accounts here
                    counter++;
            }
        }
        return counter;
    }

    function get() public view returns (uint){
        uint counter;
        for (uint i=0;i<ratings.length;i++) {
            if (ratingToOwner[i] == msg.sender) {
                if (_isScoreValid(ratings[i].score))    //TODO if ban is ever implemented again add a check for banned accounts here
                    counter++;
            }
        }
        return counter;
    }*/



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
}