import bulmaCarousel from 'bulma-carousel';

document.addEventListener('turbolinks:load', () => {
    const items = document.getElementById('carousel');
    if (items) {
        bulmaCarousel.attach('#carousel', {
            slidesToScroll: 1,
            slidesToShow: 3,
            infinite: true,
            autoplay: true
        });
    }
})