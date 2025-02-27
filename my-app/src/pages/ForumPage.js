import React, { useState } from "react";

const ForumPage = () => {
    document.title = "Form Page";
    const [formData, setFormData] = useState({
        firstName: "",
        lastName: "",
        age: "",
        hobby: "Video Games",
    });
    const [submitted, setSubmitted] = useState(false);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        if (!formData.firstName || !formData.lastName || !formData.age) {
            alert("Please fill in all fields");
            return;
        }

        if (isNaN(formData.age)) {
            alert("Age must be a number");
            return;
        }

        // Simulating saving to a JSON file (in real-world, you'd send it to a backend)
        console.log("Submitted Data:", formData);
        setSubmitted(true);
    };

    return (
        <div className="h-screen flex items-center justify-center bg-gray-100">
            <div className="p-6 bg-white shadow-lg rounded-xl w-96">
                <h2 className="text-xl font-bold mb-4">Forum Registration</h2>
                <form onSubmit={handleSubmit}>
                    <input
                        type="text"
                        name="firstName"
                        placeholder="First Name"
                        value={formData.firstName}
                        onChange={handleChange}
                        className="w-full p-2 mb-3 border rounded"
                        required
                    />
                    <input
                        type="text"
                        name="lastName"
                        placeholder="Last Name"
                        value={formData.lastName}
                        onChange={handleChange}
                        className="w-full p-2 mb-3 border rounded"
                        required
                    />
                    <input
                        type="number"
                        name="age"
                        placeholder="Age"
                        value={formData.age}
                        onChange={handleChange}
                        className="w-full p-2 mb-3 border rounded"
                        required
                    />
                    <select
                        name="hobby"
                        value={formData.hobby}
                        onChange={handleChange}
                        className="w-full p-2 mb-3 border rounded"
                    >
                        <option value="Video Games">Video Games</option>
                        <option value="Gym">Gym</option>
                        <option value="Cooking">Cooking</option>
                        <option value="Walking">Walking</option>
                        <option value="Running">Running</option>
                    </select>
                    <button
                        type="submit"
                        className="w-full bg-blue-500 text-white p-2 rounded hover:bg-blue-600"
                    >
                        Submit
                    </button>
                </form>
                {submitted && (
                    <p className="mt-4 text-green-600 font-bold">Successfully Submitted!</p>
                )}
            </div>
        </div>
    );
};

export default ForumPage;
