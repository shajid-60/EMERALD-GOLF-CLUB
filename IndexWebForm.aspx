<%@ Page Title="Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="IndexWebForm.aspx.cs"
    Inherits="Emerald.IndexWebForm" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

<!-- HERO -->
<section class="hero">

    <video class="hero-video"
           autoplay
           muted
           loop
           playsinline>

        <source src="Videos/golf-hero.mp4"
                type="video/mp4" />

    </video>

    <div class="hero-overlay"></div>

    <div class="hero-content">

        <span class="hero-subtitle">
            EST. 2026
        </span>

        <h1>
            Emerald Fairways
        </h1>

        <p>
            Championship Golf • Luxury Lifestyle • Exclusive Membership
        </p>

        <a href="Membership.aspx"
           class="btn-gold">
            Join Today
        </a>

    </div>

</section>

<!-- ABOUT -->
<section class="about-section">

    <div class="container">

        <h2>
            Discover Our Legacy
        </h2>

        <p>
            Experience championship golf, luxury hospitality,
            elite networking, fine dining and unforgettable events
            in one of the most prestigious golf communities.
        </p>

    </div>

</section>

<!-- FEATURES -->
<section class="features-section">

    <div class="container">

        <div class="feature-card">

            <h3>Championship Course</h3>

            <p>
                World-class golf course designed for professionals and enthusiasts.
            </p>

        </div>

        <div class="feature-card">

            <h3>Exclusive Membership</h3>

            <p>
                Access premium facilities, tournaments and private events.
            </p>

        </div>

        <div class="feature-card">

            <h3>Luxury Events</h3>

            <p>
                Gala dinners, networking sessions and member-exclusive experiences.
            </p>

        </div>

    </div>

</section>

<!-- STATISTICS -->
<section class="stats-section">

    <div class="container stats-grid">

        <div class="stat-box">

            <h2 class="counter"
                data-target="1200">0</h2>

            <p>Members</p>

        </div>

        <div class="stat-box">

            <h2 class="counter"
                data-target="150">0</h2>

            <p>Events</p>

        </div>

        <div class="stat-box">

            <h2 class="counter"
                data-target="75">0</h2>

            <p>Tournaments</p>

        </div>

        <div class="stat-box">

            <h2 class="counter"
                data-target="25">0</h2>

            <p>Years Excellence</p>

        </div>

    </div>

</section>

<!-- EVENTS -->
<section class="events-section">

    <div class="container">

        <h2>
            Upcoming Events
        </h2>

        <div class="events-grid">

            <asp:Repeater ID="rptEvents"
                          runat="server">

                <ItemTemplate>

                    <div class="event-card">

                        <img src='<%# Eval("EventImage") %>' />

                        <h3>
                            <%# Eval("EventTitle") %>
                        </h3>

                        <p>
                            <%# Convert.ToDateTime(Eval("EventDate")).ToString("dd MMM yyyy") %>
                        </p>

                        <p>
                             <%# Eval("EventDescription") %>
                        </p>



                        <p>
                            <%# Eval("EventDescription") %>
                        </p>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>

</section>

<!-- GALLERY -->
<section class="gallery-section">

    <div class="container">

        <h2>
            Club Gallery
        </h2>

        <div class="gallery-grid">

            <img src="https://images.unsplash.com/photo-1587174486073-ae5e5cff23aa?w=800" />

            <img src="https://images.unsplash.com/photo-1535131749006-b7f58c99034b?w=800" />

            <img src="https://images.unsplash.com/photo-1500932334442-8761ee4810a7?w=800" />

            <img src="https://images.unsplash.com/photo-1517457373958-b7bdd4587205?w=800" />

            <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?w=800" />

            <img src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=800" />

        </div>

    </div>

</section>

<!-- TESTIMONIALS -->
<section class="testimonial-section">

    <div class="container">

        <h2>
            What Our Members Say
        </h2>

        <asp:Repeater ID="rptTestimonials"
                      runat="server">

            <ItemTemplate>

                <div class="testimonial-card">

                    <p>
                        "<%# Eval("Message") %>"
                    </p>

                    <h4>
                        <%# Eval("CustomerName") %>
                    </h4>

                    <span>
                        <%# Eval("Position") %>
                    </span>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</section>

<!-- MEMBERSHIP CTA -->
<section class="membership-cta">

    <div class="container">

        <h2>
            Become A Member
        </h2>

        <p>
            Join one of the most prestigious golf communities and enjoy exclusive benefits.
        </p>

        <a href="Membership.aspx"
           class="btn-gold">

            Apply For Membership

        </a>

    </div>

</section>



</asp:Content>