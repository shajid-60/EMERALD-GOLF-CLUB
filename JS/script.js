// ======================
// NAVBAR SCROLL EFFECT
// ======================

window.addEventListener("scroll", function () {

    const navbar =
        document.querySelector(".navbar");

    if (!navbar) return;

    if (window.scrollY > 50) {

        navbar.style.background =
            "rgba(0, 0, 0, 0.90)";

    }
    else {

        navbar.style.background =
            "rgba(0, 0, 0, 0.60)";
    }
});


// ======================
// FEATURE CARD HOVER
// ======================

document.addEventListener(
    "DOMContentLoaded",
    function () {

        const cards =
            document.querySelectorAll(".feature-card");

        cards.forEach(function (card) {

            card.addEventListener(
                "mouseenter",
                function () {

                    card.style.boxShadow =
                        "0 0 30px rgba(212,175,55,.4)";
                });

            card.addEventListener(
                "mouseleave",
                function () {

                    card.style.boxShadow =
                        "none";
                });

        });

    });


// ======================
// COOKIE BANNER
// ======================

document.addEventListener(
    "DOMContentLoaded",
    function () {

        const banner =
            document.getElementById("cookieBanner");

        const button =
            document.getElementById("acceptCookies");

        if (!banner || !button)
            return;

        if (localStorage.getItem("cookiesAccepted")) {

            banner.style.display = "none";

        }

        button.addEventListener(
            "click",
            function () {

                localStorage.setItem(
                    "cookiesAccepted",
                    "yes");

                banner.style.display =
                    "none";

            });

    });


// ======================
// LOADER
// ======================

window.addEventListener(
    "load",
    function () {

        const loader =
            document.getElementById("loader");

        if (!loader)
            return;

        setTimeout(function () {

            loader.style.opacity =
                "0";

            setTimeout(function () {

                loader.style.display =
                    "none";

            }, 500);

        }, 1200);

    });


// ======================
// SCROLL ANIMATION
// ======================

document.addEventListener(
    "DOMContentLoaded",
    function () {

        const animatedItems =
            document.querySelectorAll(
                ".feature-card, .event-card, .testimonial-card"
            );

        const observer =
            new IntersectionObserver(

                function (entries) {

                    entries.forEach(function (entry) {

                        if (entry.isIntersecting) {

                            entry.target.classList.add(
                                "show-animation"
                            );

                        }

                    });

                },

                {
                    threshold: 0.2
                }

            );

        animatedItems.forEach(function (item) {

            item.classList.add(
                "scroll-animation"
            );

            observer.observe(item);

        });

    });