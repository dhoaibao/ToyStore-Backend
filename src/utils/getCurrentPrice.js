export default function getCurrentPrice(prices) {
    const currentTime = new Date();
    const price = prices.find(item => {
        if (item.endDate) {
            return currentTime >= item.startDate && currentTime <= item.endDate;
        }
        return currentTime >= item.startDate;
    }).price;
    return price;
};