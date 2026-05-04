// ============================================================
//  EMERALD FAIRWAYS — script.js
//  BGM Strategy: Entry screen click = user gesture = music plays.
//  This is the ONLY reliable way to guarantee audio in all browsers.
// ============================================================

document.addEventListener('DOMContentLoaded', () => {

  const bgm         = document.getElementById('bgm');
  const loaderScreen = document.getElementById('loaderScreen');
  const loaderBar    = document.getElementById('loaderBar');
  const loaderPct    = document.getElementById('loaderPct');
  const musicBtn     = document.getElementById('musicBtn');
  const musicIcon    = document.getElementById('musicIcon');

  if (bgm) bgm.volume = 0.28;
  let isMuted = false;

  /* ----------------------------------------------------------
     1. AUTO LOADER — animates progress bar over ~2.5s then
        fades out automatically. No click required.
  ---------------------------------------------------------- */
  let pct = 0;
  const totalDuration = 2500; // ms
  const interval = 30;        // tick every 30ms
  const steps = totalDuration / interval;

  const loaderTick = setInterval(() => {
    // Ease-out curve: fast at start, slow at end
    pct = Math.min(pct + (100 - pct) * 0.045 + 0.4, 100);
    const display = Math.floor(pct);
    if (loaderBar) loaderBar.style.width = display + '%';
    if (loaderPct) loaderPct.textContent  = display + '%';

    if (pct >= 99.5) {
      clearInterval(loaderTick);
      if (loaderBar) loaderBar.style.width = '100%';
      if (loaderPct) loaderPct.textContent  = '100%';

      // Short pause at 100% then fade out
      setTimeout(() => {
        loaderScreen.classList.add('hidden');
        setTimeout(() => musicBtn.classList.add('visible'), 400);
      }, 350);
    }
  }, interval);


  /* ----------------------------------------------------------
     2. BGM — try immediately; if browser blocks it, play on
        the very first user interaction after loader completes.
  ---------------------------------------------------------- */
  function tryPlay() {
    if (!bgm) return;
    bgm.play().catch(() => {
      // Browser blocked autoplay — wait for first interaction
      const events = ['click', 'scroll', 'keydown', 'touchstart', 'mousemove'];
      function onFirstInteraction() {
        bgm.play().catch(() => {});
        events.forEach(e => document.removeEventListener(e, onFirstInteraction));
      }
      events.forEach(e =>
        document.addEventListener(e, onFirstInteraction, { once: true, passive: true })
      );
    });
  }

  // Try to play as soon as loader finishes (~2.5s)
  setTimeout(tryPlay, 2600);


  /* ----------------------------------------------------------
     3. MUSIC BUTTON — mute / unmute only
  ---------------------------------------------------------- */
  if (musicBtn && bgm) {
    musicBtn.addEventListener('click', () => {
      if (isMuted) {
        bgm.muted = false; isMuted = false;
        musicBtn.classList.remove('muted');
        musicBtn.setAttribute('aria-label', 'Mute music');
        musicIcon.className = 'fa-solid fa-volume-high music-icon';
      } else {
        bgm.muted = true; isMuted = true;
        musicBtn.classList.add('muted');
        musicBtn.setAttribute('aria-label', 'Unmute music');
        musicIcon.className = 'fa-solid fa-volume-xmark music-icon';
      }
    });
  }


  /* ----------------------------------------------------------
     3. NAVBAR — scrolled class
  ---------------------------------------------------------- */
  const navbar = document.getElementById('navbar');
  window.addEventListener('scroll', () => {
    navbar.classList.toggle('scrolled', window.scrollY > 60);
  }, { passive: true });


  /* ----------------------------------------------------------
     4. HAMBURGER / MOBILE MENU
  ---------------------------------------------------------- */
  const hamburgerBtn = document.getElementById('hamburgerBtn');
  const mobileMenu   = document.getElementById('mobileMenu');
  const menuBackdrop = document.getElementById('menuBackdrop');
  const mobileClose  = document.getElementById('mobileMenuClose');

  function openMenu() {
    hamburgerBtn.classList.add('open');
    mobileMenu.classList.add('open');
    menuBackdrop.classList.add('open');
    document.body.style.overflow = 'hidden';
  }
  function closeMenu() {
    hamburgerBtn.classList.remove('open');
    mobileMenu.classList.remove('open');
    menuBackdrop.classList.remove('open');
    document.body.style.overflow = '';
  }

  hamburgerBtn.addEventListener('click', () =>
    mobileMenu.classList.contains('open') ? closeMenu() : openMenu()
  );
  if (mobileClose) mobileClose.addEventListener('click', closeMenu);
  menuBackdrop.addEventListener('click', closeMenu);
  mobileMenu.querySelectorAll('a').forEach(link => link.addEventListener('click', closeMenu));


  /* ----------------------------------------------------------
     5. HERO SCROLL-DOWN
  ---------------------------------------------------------- */
  document.getElementById('scrollDown')?.addEventListener('click', () => {
    document.getElementById('about')?.scrollIntoView({ behavior: 'smooth' });
  });


  /* ----------------------------------------------------------
     6. SCROLL-TO-TOP
  ---------------------------------------------------------- */
  const scrollTopBtn = document.getElementById('scrollTop');
  if (scrollTopBtn) {
    window.addEventListener('scroll', () => {
      scrollTopBtn.classList.toggle('visible', window.scrollY > 400);
    }, { passive: true });
    scrollTopBtn.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }


  /* ----------------------------------------------------------
     7. WHY SECTION — feature switcher
  ---------------------------------------------------------- */
  const whyFeatures = document.querySelectorAll('.why-feature');
  const whyImgs     = document.querySelectorAll('.why-img');
  whyFeatures.forEach(feature => {
    feature.addEventListener('click', () => {
      const idx = parseInt(feature.dataset.index, 10);
      whyFeatures.forEach(f => f.classList.remove('active'));
      feature.classList.add('active');
      whyImgs.forEach(img => img.classList.remove('active'));
      if (whyImgs[idx]) whyImgs[idx].classList.add('active');
    });
  });


  /* ----------------------------------------------------------
     8. SCROLL ANIMATIONS — fade-up
  ---------------------------------------------------------- */
  [
    '.about-top', '.stats-grid .stat-card', '.retreat-text h2',
    '.retreat-image', '.why-left', '.events-top', '.events-grid .event-card',
  ].forEach(sel => {
    document.querySelectorAll(sel).forEach(el => el.classList.add('fade-up'));
  });

  const fadeObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        fadeObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 });
  document.querySelectorAll('.fade-up').forEach(el => fadeObserver.observe(el));


  /* ----------------------------------------------------------
     9. STAGGER DELAYS
  ---------------------------------------------------------- */
  document.querySelectorAll('.stats-grid .stat-card').forEach((c, i) => { c.style.transitionDelay = `${i * 0.1}s`; });
  document.querySelectorAll('.events-grid .event-card').forEach((c, i) => { c.style.transitionDelay = `${i * 0.1}s`; });


  /* ----------------------------------------------------------
     10. ANIMATED STAT COUNTERS
  ---------------------------------------------------------- */
  function animateCount(el, target, duration = 1400) {
    let start = null;
    const step = (ts) => {
      if (!start) start = ts;
      const progress = Math.min((ts - start) / duration, 1);
      el.textContent = Math.floor((1 - Math.pow(1 - progress, 3)) * target);
      if (progress < 1) requestAnimationFrame(step);
      else el.textContent = target;
    };
    requestAnimationFrame(step);
  }
  const counterObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        animateCount(entry.target, parseInt(entry.target.dataset.count, 10));
        counterObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.4 });
  document.querySelectorAll('.stat-num[data-count]').forEach(el => counterObserver.observe(el));


  /* ----------------------------------------------------------
     11. DISCOVER MORE / SHOW LESS
  ---------------------------------------------------------- */
  const btnDiscover = document.getElementById('btnDiscover');
  const btnCollapse = document.getElementById('btnCollapse');
  const eventsMore  = document.getElementById('eventsMore');

  btnDiscover?.addEventListener('click', () => {
    eventsMore.classList.add('visible');
    eventsMore.querySelectorAll('.event-card').forEach((card, i) => {
      card.classList.add('fade-up');
      card.style.transitionDelay = `${i * 0.1}s`;
      setTimeout(() => card.classList.add('visible'), 50 + i * 100);
    });
    btnDiscover.style.display = 'none';
    btnCollapse.style.display = 'inline-flex';
    setTimeout(() => eventsMore.scrollIntoView({ behavior: 'smooth', block: 'start' }), 120);
  });

  btnCollapse?.addEventListener('click', () => {
    eventsMore.classList.remove('visible');
    btnCollapse.style.display = 'none';
    btnDiscover.style.display = 'inline-flex';
    document.getElementById('events')?.scrollIntoView({ behavior: 'smooth' });
  });


  /* ----------------------------------------------------------
     12. MEMBERSHIP MODAL
  ---------------------------------------------------------- */
  const membershipModal = document.getElementById('membershipModal');
  const openMM  = () => { membershipModal.classList.add('open');    document.body.style.overflow = 'hidden'; };
  const closeMM = () => { membershipModal.classList.remove('open'); document.body.style.overflow = ''; };

  document.getElementById('btnJoin')?.addEventListener('click', openMM);
  document.getElementById('btnApply')?.addEventListener('click', openMM);
  document.getElementById('modalClose')?.addEventListener('click', closeMM);
  membershipModal?.addEventListener('click', (e) => { if (e.target === membershipModal) closeMM(); });


  /* ----------------------------------------------------------
     13. TEE TIME MODAL (built dynamically)
  ---------------------------------------------------------- */
  const teeModal = document.createElement('div');
  teeModal.className = 'tee-modal-backdrop';
  teeModal.id = 'teeModal';
  teeModal.innerHTML = `
    <div class="tee-modal-box">
      <button class="tee-modal-close" id="teeClose" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>
      <span class="section-label">RESERVATIONS</span>
      <h2>Book a <em>Tee Time</em></h2>
      <p>Our online booking system is being upgraded. Please contact us directly to reserve your preferred tee time.</p>
      <a href="tel:+17075553612" style="display:flex;align-items:center;gap:0.7rem;font-size:0.83rem;color:rgba(255,255,255,0.8);margin-bottom:0.75rem;">
        <i class="fa-solid fa-phone" style="color:#C9A84C;width:16px;"></i> +1 (707) 555-3612
      </a>
      <a href="mailto:info@emeraldfw.com" style="display:flex;align-items:center;gap:0.7rem;font-size:0.83rem;color:rgba(255,255,255,0.8);margin-bottom:2rem;">
        <i class="fa-regular fa-envelope" style="color:#C9A84C;width:16px;"></i> info@emeraldfw.com
      </a>
      <button class="btn-gold" style="width:100%;padding:1rem;" id="teeCloseBtn">CLOSE</button>
    </div>`;
  document.body.appendChild(teeModal);

  const openTee  = () => { teeModal.classList.add('open');    document.body.style.overflow = 'hidden'; };
  const closeTee = () => { teeModal.classList.remove('open'); document.body.style.overflow = ''; };

  document.getElementById('teeClose')?.addEventListener('click', closeTee);
  document.getElementById('teeCloseBtn')?.addEventListener('click', closeTee);
  teeModal.addEventListener('click', (e) => { if (e.target === teeModal) closeTee(); });
  document.querySelectorAll('.btn-tee-time').forEach(btn => btn.addEventListener('click', openTee));


  /* ----------------------------------------------------------
     14. PARALLAX on hero
  ---------------------------------------------------------- */
  const heroSection = document.querySelector('.hero');
  if (heroSection) {
    window.addEventListener('scroll', () => {
      if (window.scrollY < window.innerHeight) {
        heroSection.style.backgroundPositionY = `calc(center + ${window.scrollY * 0.35}px)`;
      }
    }, { passive: true });
  }


  /* ----------------------------------------------------------
     15. ESCAPE KEY — close modals & menus
  ---------------------------------------------------------- */
  document.addEventListener('keydown', (e) => {
    if (e.key !== 'Escape') return;
    closeMM(); closeMenu(); closeTee();
  });

}); // end DOMContentLoaded
