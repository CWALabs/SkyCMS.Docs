---
canonical_title: Contact Form API Example (HTML)
description: Use this example when you want a complete, copy-ready contact form implementation that integrates with the SkyCMS Contact Form API JavaScript client.
doc_type: Reference
product_area: development
user_intent: implement-contact-form-using-skycms-api-example
audience:
  - Full-Stack Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Contact Form API Example (HTML)

## Summary

Use this example when you want a complete, copy-ready contact form implementation that integrates with the SkyCMS Contact Form API JavaScript client.

## When to use this page

Use this example as a starting point rather than building the form from scratch. It works with standard server-rendered websites using the SkyCMS JavaScript client library. If your site uses a JavaScript framework such as React or Vue, adapt the event handling and submission logic accordingly.

## Complete example

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form Example - SkyCMS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #f5f5f5;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            min-height: 120px;
        }

        button {
            background: #007bff;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            display: none;
        }

        .success-message {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error-message {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>

<body>
    <div class="form-container">
        <h1>Contact Us</h1>

        <!-- Success Message -->
        <div id="successMessage" class="message success-message"></div>

        <!-- Error Message -->
        <div id="errorMessage" class="message error-message"></div>

        <!-- Contact Form -->
        <form id="contactForm">
            <div class="form-group">
                <label for="fullName">Full Name *</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>

            <div class="form-group">
                <label for="emailAddress">Email Address *</label>
                <input type="email" id="emailAddress" name="emailAddress" required>
            </div>

            <div class="form-group">
                <label for="comments">Message *</label>
                <textarea id="comments" name="comments" required></textarea>
            </div>

            <button type="submit">Send Message</button>
        </form>
    </div>

    <!-- Load SkyCMS Contact API JavaScript -->
    <script src="/_api/contact/skycms-contact.js"></script>

    <!-- Initialize the form -->
    <script>
        // CORRECT: Initialize once with field mapping and callbacks.
        SkyCmsContact.init('#contactForm', {
            fieldNames: {
                name: 'fullName',
                email: 'emailAddress',
                message: 'comments'
            },
            onSuccess: (result) => {
                document.getElementById('errorMessage').style.display = 'none';

                const successEl = document.getElementById('successMessage');
                successEl.textContent = result.message;
                successEl.style.display = 'block';

                window.scrollTo({ top: 0, behavior: 'smooth' });
            },
            onError: (result) => {
                document.getElementById('successMessage').style.display = 'none';

                const errorEl = document.getElementById('errorMessage');
                errorEl.textContent = result.message;
                errorEl.style.display = 'block';

                window.scrollTo({ top: 0, behavior: 'smooth' });
            }
        });

        // WRONG: Do not initialize multiple times.
        // Calling init() multiple times attaches duplicate event listeners.
    </script>
</body>

</html>
```

## Related guides

- [API: Contact Form](./contact-form.md)
- [API Integration Guide](./integration-guide.md)
- [API Tutorial](./tutorial.md)
