console.log("suryadutta Dash")




const sideToggleBar = () => {

	if ($(".relative").is(":visible")) {
		console.log("loaded");
		$(".relative").css("right", "30%");
	} else {

		$(".relative").css("right", "-30%");
	}
}






function deleteContact(eid) {
	Swal.fire({
		title: "Are you sure?",
		text: "You won't be able to revert this!",
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Yes, delete it!"
	}).then((result) => {
		if (result.isConfirmed) {

			window.location = "/smsfrontend/deleteEmp/" + eid;

		}
	});
}


document.addEventListener("DOMContentLoaded", function(event) {

	const showNavbar = (toggleId, navId, bodyId, headerId) => {
		const toggle = document.getElementById(toggleId),
			nav = document.getElementById(navId),
			bodypd = document.getElementById(bodyId),
			headerpd = document.getElementById(headerId)

		// Validate that all variables exist
		if (toggle && nav && bodypd && headerpd) {
			toggle.addEventListener('click', () => {
				// show navbar
				nav.classList.toggle('show')
				// change icon
				toggle.classList.toggle('bx-x')
				// add padding to body
				bodypd.classList.toggle('body-pd')
				// add padding to header
				headerpd.classList.toggle('body-pd')
			})
		}
	}

	showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

	/*===== LINK ACTIVE =====*/
	const linkColor = document.querySelectorAll('.nav_link')

	function colorLink() {
		if (linkColor) {
			linkColor.forEach(l => l.classList.remove('active'))
			this.classList.add('active')
		}
	}
	linkColor.forEach(l => l.addEventListener('click', colorLink))

	// Your code to run since DOM is loaded and ready
});




