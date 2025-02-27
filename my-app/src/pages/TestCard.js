import React from "react";

const getRandomCardColor = () => {
    return Math.random() < 0.5 ? "bg-blue-500" : "bg-red-500";
};

const TestCard = () => {
    const cardColor = getRandomCardColor();
    document.title = "Card Page";

    return (
        <div className={`h-screen flex items-center justify-center`}>
            <div className={`w-64 h-96 ${cardColor} rounded-2xl shadow-lg flex items-center justify-center text-white text-2xl font-bold`}>
                {cardColor === "bg-blue-500" ? "Blue Card" : "Red Card"}
            </div>
        </div>
    );
};

export default TestCard;
