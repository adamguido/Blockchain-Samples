// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
`   // Smart contract for fetches real-world data (like the current weather or a currency exchange rate) and acts upon that data (e.g., release funds if the weather is sunny).
contract DataConsumerV3 {
    
        AggregatorV3Interface internal priceFeed;
    
        /**
        * Network: Polygon
        * Aggregator: MATIC/USD
        * Address: 0xAB594600376Ec9fD91F8e885dADF0CE036862dE0
        */
        constructor() {
            priceFeed = AggregatorV3Interface(0xAB594600376Ec9fD91F8e885dADF0CE036862dE0);
        }
    
        /**
        * Returns the latest price
        */
        function getLatestPrice() public view returns (int) {
            (
                uint80 roundID, 
                int price,
                uint startedAt,
                uint timeStamp,
                uint80 answeredInRound
            ) = priceFeed.latestRoundData();
            return price;
        }
        
}
