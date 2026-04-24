// ============================================================
//  EMERALD FAIRWAYS — script.js
// ============================================================

document.addEventListener('DOMContentLoaded', () => {

  /* ----------------------------------------------------------
     1. NAVBAR — add .scrolled class after scrolling 60px
  ---------------------------------------------------------- */
  const navbar = document.getElementById('navbar');

  window.addEventListener('scroll', () => {
    if (window.scrollY > 60) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });


  /* ----------------------------------------------------------
     2. HAMBURGER MENU — toggle mobile menu
  ---------------------------------------------------------- */
  const hamburgerBtn = document.getElementById('hamburgerBtn');
  const mobileMenu   = document.getElementById('mobileMenu');

  hamburgerBtn.addEventListener('click', () => {
    hamburgerBtn.classList.toggle('open');
    mobileMenu.classList.toggle('open');
  });

  // Close mobile menu when a link is clicked
  mobileMenu.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      hamburgerBtn.classList.remove('open');
      mobileMenu.classList.remove('open');
    });
  });


  /* ----------------------------------------------------------
     3. HERO SCROLL-DOWN BUTTON
  ---------------------------------------------------------- */
  const scrollDownBtn = document.getElementById('scrollDown');
  if (scrollDownBtn) {
    scrollDownBtn.addEventListener('click', () => {
      const aboutSection = document.getElementById('about');
      if (aboutSection) {
        aboutSection.scrollIntoView({ behavior: 'smooth' });
      }
    });
  }


  /* ----------------------------------------------------------
     4. SCROLL-TO-TOP BUTTON
  ---------------------------------------------------------- */
  const scrollTopBtn = document.getElementById('scrollTop');
  if (scrollTopBtn) {
    scrollTopBtn.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }


  /* ----------------------------------------------------------
     5. WHY SECTION — feature switcher
     Clicking a feature updates the active state and swaps image
  ---------------------------------------------------------- */
  const whyFeatures = document.querySelectorAll('.why-feature');
  const whyImgs     = document.querySelectorAll('.why-img');

  whyFeatures.forEach(feature => {
    feature.addEventListener('click', () => {
      const index = parseInt(feature.dataset.index, 10);

      // Update feature active states
      whyFeatures.forEach(f => f.classList.remove('active'));
      feature.classList.add('active');

      // Swap the image
      whyImgs.forEach(img => img.classList.remove('active'));
      if (whyImgs[index]) {
        whyImgs[index].classList.add('active');
      }
    });
  });


  /* ----------------------------------------------------------
     6. SCROLL ANIMATIONS — fade-up on elements entering viewport
  ---------------------------------------------------------- */
  // Add .fade-up to elements we want to animate
  const animTargets = [
    '.about-top',
    '.stats-grid .stat-card',
    '.retreat-text h2',
    '.retreat-image',
    '.why-left',
    '.events-top',
    '.events-grid .event-card',
  ];

  animTargets.forEach(selector => {
    document.querySelectorAll(selector).forEach(el => {
      el.classList.add('fade-up');
    });
  });

  // Intersection Observer
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
          observer.unobserve(entry.target); // animate once
        }
      });
    },
    { threshold: 0.12 }
  );

  document.querySelectorAll('.fade-up').forEach(el => observer.observe(el));


  /* ----------------------------------------------------------
     7. STAT CARDS — stagger fade-in delay
  ---------------------------------------------------------- */
  document.querySelectorAll('.stats-grid .stat-card').forEach((card, i) => {
    card.style.transitionDelay = `${i * 0.12}s`;
  });

  document.querySelectorAll('.events-grid .event-card').forEach((card, i) => {
    card.style.transitionDelay = `${i * 0.12}s`;
  });


  /* ----------------------------------------------------------
     8. BOOK TEE TIME BUTTONS — simple alert placeholder
     (Replace with a real modal / booking integration)
  ---------------------------------------------------------- */
  document.querySelectorAll('.btn-tee-time').forEach(btn => {
    btn.addEventListener('click', () => {
      alert('Booking system coming soon!\nPlease call +1 (707) 555-3612 to reserve your tee time.');
    });
  });


  /* ----------------------------------------------------------
     9. JOIN US / APPLY buttons — simple alert placeholder
  ---------------------------------------------------------- */
  document.querySelector('.btn-join')?.addEventListener('click', () => {
    alert('Membership applications are currently open!\nPlease email info@emeraldfw.com to get started.');
  });

  document.querySelectorAll('.btn-gold').forEach(btn => {
    if (btn.textContent.trim().includes('APPLY')) {
      btn.addEventListener('click', () => {
        document.getElementById('events')?.scrollIntoView({ behavior: 'smooth' });
      });
    }
  });


  /* ----------------------------------------------------------
     10. PARALLAX EFFECT on hero background (subtle)
  ---------------------------------------------------------- */
  const heroSection = document.querySelector('.hero');

  if (heroSection) {
    window.addEventListener('scroll', () => {
      const scrolled = window.scrollY;
      // Only apply while hero is visible
      if (scrolled < window.innerHeight) {
        heroSection.style.backgroundPositionY = `${scrolled * 0.4}px`;
      }
    });
  }

}); // end DOMContentLoaded
