/* Design examples operate only in page memory. They never confirm or export a clinical record. */
const demoForm = document.querySelector('#demo-form');
const demoTitle = document.querySelector('#demo-title');
const demoNote = document.querySelector('#demo-note');
const demoStatus = document.querySelector('#demo-status');
const saveButton = document.querySelector('#demo-save');
let isSaving = false;
let editVersion = 0;
function markUnsaved() {
	editVersion += 1;
	demoStatus.textContent = 'Unsaved changes · Design example only.';
}
demoForm.addEventListener('input', markUnsaved);
demoNote.style.fontSize = 'var(--font-size-body-lg)';
demoForm.addEventListener('submit', async (event) => {
	event.preventDefault();
	if (isSaving) return;
	const isInvalid = !demoTitle.value.trim();
	demoTitle.setAttribute('aria-invalid', String(isInvalid));
	document.querySelector('#title-error').hidden = !isInvalid;
	if (isInvalid) {
		demoStatus.textContent = 'Could not save · Enter a draft title.';
		demoTitle.focus();
		return;
	}
	// A visible delay demonstrates loading without suggesting a real provider write.
	const savedVersion = editVersion;
	isSaving = true;
	saveButton.disabled = true;
	saveButton.setAttribute('aria-busy', 'true');
	saveButton.textContent = 'Saving example…';
	demoStatus.textContent = 'Saving · In-page design example.';
	await new Promise((resolve) => setTimeout(resolve, 650));
	demoStatus.textContent = savedVersion === editVersion
		? 'Saved example · Kept in this page only; no clinical record was created.'
		: 'Unsaved changes · Text changed while the example was saving.';
	isSaving = false;
	saveButton.disabled = false;
	saveButton.removeAttribute('aria-busy');
	saveButton.textContent = 'Save draft ↪';
});
demoForm.addEventListener('reset', () => {
	editVersion += 1;
	demoTitle.removeAttribute('aria-invalid');
	document.querySelector('#title-error').hidden = true;
	demoStatus.textContent = 'Design example · No unsaved changes.';
});
const exampleSwitch = document.querySelector('#example-switch');
exampleSwitch.addEventListener('click', () => {
	const isOn = exampleSwitch.getAttribute('aria-checked') !== 'true';
	exampleSwitch.setAttribute('aria-checked', String(isOn));
	document.querySelector('#switch-label').textContent = `Show helper text: ${isOn ? 'On' : 'Off'}`;
	document.querySelector('#switch-help').hidden = !isOn;
});
const patterns = {
	capture: ['Start with your own words.', 'Documentation starts with what you observed and said. The person providing care stays in control.'],
	draft: ['A clearer starting point.', 'AI drafts from your own notes. Every draft stays available for your review.'],
	review: ['The nurse is the author.', 'Read the draft alongside your original words. You decide what becomes a record.'],
	handover: ['Bring the words together.', 'Keep handover grounded in the records you have reviewed.']
};
document.querySelectorAll('[data-pattern]').forEach((button) => {
	button.addEventListener('click', () => {
		document.querySelectorAll('[data-pattern]').forEach((item) => item.setAttribute('aria-pressed', String(item === button)));
		const [title, copy] = patterns[button.dataset.pattern];
		document.querySelector('#pattern-title').textContent = title;
		document.querySelector('#pattern-copy').textContent = copy;
	});
});
const tokenStyle = getComputedStyle(document.documentElement);
document.querySelectorAll('[data-token]').forEach((label) => {
	label.textContent = tokenStyle.getPropertyValue(`--${label.dataset.token}`).trim();
});
