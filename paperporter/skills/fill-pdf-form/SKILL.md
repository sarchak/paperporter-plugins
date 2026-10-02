---
name: fill-pdf-form
description: Fill an official PDF form, such as a city building permit, business license, or other government application, with the PaperPorter tools. Use when the user wants to find, fill out, complete, or download an official PDF form in its original layout.
---

# Fill an official PDF form with PaperPorter

PaperPorter fills reviewed copies of official PDF forms without changing their layout. The user signs and submits the printed form themselves.

## Workflow

1. **Find the form.** Call `search_forms` with the city, agency, or form name the user mentioned. If several forms match, show the titles and jurisdictions and ask which one they mean. If none match, say so; do not substitute a different form.
2. **Read the questions.** Call `get_form_requirements` for the chosen form. Long forms are paged by section; keep calling with `next_offset` until you have every section you need.
3. **Create a draft.** Call `create_application` for the form.
4. **Collect answers.** Ask the user for the information the questions need, a few related questions at a time. Use only what the user tells you. Never invent, guess, or fill in plausible values.
5. **Save answers.** Call `update_application` with `answers_patch` and the current `expected_revision`.
6. **Validate.** Call `validate_application` and fix every issue it reports with the user.
7. **Confirm.** Show the user every saved answer and ask them to confirm. Do not continue without an explicit yes.
8. **Generate.** Call `generate_filled_pdf` with the `reviewed_revision` the user confirmed, then `get_pdf_download` and give the user the link. Links expire after 15 minutes.

## Answer formats

- Use the exact choice values a question lists.
- Dates are `YYYY-MM-DD`; the form prints them in its own format.
- Checkboxes take booleans and number questions take numbers.
- Keep text within `approx_max_chars`. If validation reports `TEXT_OVERFLOW`, shorten or abbreviate with the user.
- Questions with `shown_when` apply only when that condition holds. Answers to questions that no longer apply are cleared automatically.

## Rules

- Signatures are never filled. Tell the user to sign the printed form.
- An application stays on the form version it was created with. If a response includes `template_update`, tell the user a newer version was published and start a new application for it.
- Only call `delete_application` when the user asks to delete a specific application.
- PaperPorter does not submit forms or pay fees. Remind the user to check the issuing office's current instructions before submitting.
