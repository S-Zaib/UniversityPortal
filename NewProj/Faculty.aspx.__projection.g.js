
/* BEGIN EXTERNAL SOURCE */

        function openForm() {
            document.getElementById("miniDistributionForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("miniDistributionForm").style.display = "none";
        }

        $(document).ready(function () {
            // Form submission
            $("form").submit(function (e) {
                e.preventDefault();
                // Get form data
                var formData = {
                    evalName1: $("#evalName1").val(),
                    weightage1: $("#weightage1").val(),
                    evalName2: $("#evalName2").val(),
                    weightage2: $("#weightage2").val(),
                    evalName3: $("#evalName3").val(),
                    weightage3: $("#weightage3").val(),
                    evalName4: $("#evalName4").val(),
                    weightage4: $("#weightage4").val()
                };

                // Perform form validation
                if (validateForm(formData)) {
                    // Submit the form data to the server or perform further processing
                    // You can use AJAX to send the data to the server
                    console.log(formData);
                    // Close the form
                    closeForm();
                }
            });
        });

        function validateForm(formData) {
            // Perform validation for each field
            if (formData.evalName1.trim() === "") {
                alert("Please enter a name for evaluation 1.");
                return false;
            }
            if (formData.weightage1 === "") {
                alert("Please enter the weightage for evaluation 1.");
                return false;
            }
            // Add more validation for other fields if needed

            // If all validations pass, return true
            return true;
        }
    
/* END EXTERNAL SOURCE */

/* BEGIN EXTERNAL SOURCE */

        function openForm() {
            document.getElementById("miniDistributionForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("miniDistributionForm").style.display = "none";
        }

        $(document).ready(function () {
            // Form submission
            $("form").submit(function (e) {
                e.preventDefault();
                // Get form data
                var formData = {
                    evalName1: $("#evalName1").val(),
                    weightage1: $("#weightage1").val(),
                    evalName2: $("#evalName2").val(),
                    weightage2: $("#weightage2").val(),
                    evalName3: $("#evalName3").val(),
                    weightage3: $("#weightage3").val(),
                    evalName4: $("#evalName4").val(),
                    weightage4: $("#weightage4").val()
                };

                // Perform form validation
                if (validateForm(formData)) {
                    // Submit the form data to the server or perform further processing
                    // You can use AJAX to send the data to the server
                    console.log(formData);
                    // Close the form
                    closeForm();
                }
            });
        });

        function validateForm(formData) {
            // Perform validation for each field
            if (formData.evalName1.trim() === "") {
                alert("Please enter a name for evaluation 1.");
                return false;
            }
            if (formData.weightage1 === "") {
                alert("Please enter the weightage for evaluation 1.");
                return false;
            }
            // Add more validation for other fields if needed

            // If all validations pass, return true
            return true;
        }
    
/* END EXTERNAL SOURCE */
