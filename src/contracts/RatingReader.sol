pragma solidity >=0.8.19;

import "./Rating.sol";

contract RatingReader is Rating {

    function getPositive() public view returns (uint) {
        uint positive = 0;
        for (uint i=0;i<=ratings.length;i++) {
            if (!(ratingToOwner[i] == msg.sender)) {
                Ratingdata storage myRating = ratings[i];
                if (myRating.score == 0)
                    positive++;
            }
        }
        return positive;
    }

    function getNegative() public view returns (uint) {
        uint negative = 0;
        for (uint i=0;i<=ratings.length;i++) {
            if (!(ratingToOwner[i] == msg.sender)) {
                Ratingdata storage myRating = ratings[i];
                if (myRating.score != 0)
                    negative++;
            }
        }
        return negative;
    }

    function getAllRatings() public view returns (uint) {
        uint Accountrating = 0;
        for (uint i=0;i<=ratings.length;i++) {
            if (!(ratingToOwner[i] == msg.sender))
                Accountrating++;
        }
        return Accountrating;
    }

}