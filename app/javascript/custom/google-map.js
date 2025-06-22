const fakeDB = [{
    "id": "ChIJZSqCDhu1RIYRx1iRoCvCOsA",
    "displayName": "Terry Black's Barbecue",
    "location": {
        "lat": 30.2597015,
        "lng": -97.75482339999999
    },
    "businessStatus": "OPERATIONAL",
    "nationalPhoneNumber": "(512) 394-5899",
    "postalAddress": {
        "regionCode": "US",
        "languageCode": "en-US",
        "postalCode": "78704",
        "sortingCode": null,
        "administrativeArea": "Texas",
        "locality": "Austin",
        "sublocality": null,
        "addressLines": [
            "1003 Barton Springs Rd"
        ],
        "recipients": [],
        "organization": null
    },
    "priceLevel": "MODERATE",
    "rating": 4.7,
    "servesBreakfast": false
    }, {
    "id": "ChIJM8w7rqS1RIYRhEz2-KuoqzE",
    "displayName": "Franklin Barbecue",
    "location": {
        "lat": 30.270124999999997,
        "lng": -97.73134189999999
    },
    "businessStatus": "OPERATIONAL",
    "nationalPhoneNumber": "(512) 653-1187",
    "postalAddress": {
        "regionCode": "US",
        "languageCode": "en-US",
        "postalCode": "78702",
        "sortingCode": null,
        "administrativeArea": "Texas",
        "locality": "Austin",
        "sublocality": null,
        "addressLines": [
            "900 E 11th St"
        ],
        "recipients": [],
        "organization": null
    },
    "priceLevel": "MODERATE",
    "rating": 4.7,
    "servesBreakfast": false
    }, {
    "id": "ChIJH3w8zB61RIYRhKc2dFxr5bs",
    "displayName": "Loro Asian Smokehouse & Bar",
    "location": {
        "lat": 30.2477396,
        "lng": -97.7713502
    },
    "businessStatus": "OPERATIONAL",
    "nationalPhoneNumber": "(512) 916-4858",
    "postalAddress": {
        "regionCode": "US",
        "languageCode": "en-US",
        "postalCode": "78704",
        "sortingCode": null,
        "administrativeArea": "Texas",
        "locality": "Austin",
        "sublocality": null,
        "addressLines": [
            "2115 S Lamar Blvd"
        ],
        "recipients": [],
        "organization": null
    },
    "priceLevel": "EXPENSIVE",
    "rating": 4.5,
    "servesBreakfast": false
    }, {
    "id": "ChIJH5Enqda0RIYR7UBMfuWeCvE",
    "displayName": "Matt's El Rancho",
    "location": {
        "lat": 30.245117999999998,
        "lng": -97.779281
    },
    "businessStatus": "OPERATIONAL",
    "nationalPhoneNumber": "(512) 462-9333",
    "postalAddress": {
        "regionCode": "US",
        "languageCode": "en-US",
        "postalCode": "78704",
        "sortingCode": null,
        "administrativeArea": "Texas",
        "locality": "Austin",
        "sublocality": null,
        "addressLines": [
            "2613 S Lamar Blvd"
        ],
        "recipients": [],
        "organization": null
    },
    "priceLevel": "MODERATE",
    "rating": 4.4,
    "servesBreakfast": true
    }, {
    "id": "ChIJQyfp5wm1RIYRd7IXfFuFzTg",
    "displayName": "Caroline",
    "location": {
        "lat": 30.2688157,
        "lng": -97.7422982
    },
    "businessStatus": "OPERATIONAL",
    "nationalPhoneNumber": "(512) 982-6766",
    "postalAddress": {
        "regionCode": "US",
        "languageCode": "en-US",
        "postalCode": "78701",
        "sortingCode": null,
        "administrativeArea": "Texas",
        "locality": "Austin",
        "sublocality": null,
        "addressLines": [
            "621 Congress Ave. Suite 101"
        ],
        "recipients": [],
        "organization": null
    },
    "priceLevel": "MODERATE",
    "rating": 4.8,
    "servesBreakfast": true
    }, {
    "id": "ChIJDfhk1ja1RIYR3NIISvjn88k",
    "displayName": "Aba Austin",
    "location": {
        "lat": 30.253315399999995,
        "lng": -97.74802439999999
    },
    "businessStatus": "OPERATIONAL",
    "nationalPhoneNumber": "(737) 273-0199",
    "postalAddress": {
        "regionCode": "US",
        "languageCode": "en-US",
        "postalCode": "78704",
        "sortingCode": null,
        "administrativeArea": "Texas",
        "locality": "Austin",
        "sublocality": null,
        "addressLines": [
            "1011 S Congress Ave Bldg 2 Suite 180"
        ],
        "recipients": [],
        "organization": null
    },
    "priceLevel": "EXPENSIVE",
    "rating": 4.6,
    "servesBreakfast": false
    }, {
    "id": "ChIJgUnp4nW1RIYR3LRKaVS6R3U",
    "displayName": "Raising Cane's Chicken Fingers",
    "location": {
        "lat": 30.281481799999998,
        "lng": -97.74250409999999
    },
    "businessStatus": "OPERATIONAL",
    "nationalPhoneNumber": "(512) 474-2751",
    "postalAddress": {
        "regionCode": "US",
        "languageCode": "en-US",
        "postalCode": "78701",
        "sortingCode": null,
        "administrativeArea": "Texas",
        "locality": "Austin",
        "sublocality": null,
        "addressLines": [
            "415 W Martin Luther King Jr Blvd"
        ],
        "recipients": [],
        "organization": null
    },
    "priceLevel": "INEXPENSIVE",
    "rating": 4.3,
    "servesBreakfast": false
    }
]

/**
 *
 * @param {string} place_id
 * @param {any} options
 */
export function setPlaceDetails(place_id, options) {
    const overlay_element = document.getElementById("overlay")
    const overlay_contents_element = document.getElementById("overlay_contents");
    const overlay_google_link_element = document.getElementById("overlay_google_link");
    const overlay_display_name_element = document.getElementById("overlay_display_name");
    const overlay_location_element = document.getElementById("overlay_location");
    const overlay_location_lat_element = document.getElementById("overlay_location_lat");
    const overlay_location_lng_element = document.getElementById("overlay_location_lng");
    const overlay_business_status_element = document.getElementById("overlay_business_status");
    const overlay_national_phone_number_element = document.getElementById("overlay_national_phone_number");
    const overlay_postal_address_element = document.getElementById("overlay_postal_address");
    const overlay_postal_address_region_code_element = document.getElementById("overlay_postal_address_region_code");
    const overlay_postal_address_language_code_element = document.getElementById("overlay_postal_address_language_code");
    const overlay_postal_address_postal_code_element = document.getElementById("overlay_postal_address_postal_code");
    const overlay_postal_address_sorting_code_element = document.getElementById("overlay_postal_address_sorting_code");
    const overlay_postal_address_administrative_area_element = document.getElementById("overlay_postal_address_administrative_area");
    const overlay_postal_address_locality_element = document.getElementById("overlay_postal_address_locality");
    const overlay_postal_address_address_lines_element = document.getElementById("overlay_postal_address_address_lines");

    // TODO: fetch id from real db.
    const data = fakeDB.find((e) => e.id === place_id);

    if(!data) {
        // TODO: set contents to none rather than just hide it lol
        overlay_contents_element.style.display = "none";
        return;
    }


    overlay_contents_element.style.display = "block";
    const { businessStatus, displayName, id, location, nationalPhoneNumber, postalAddress, priceLevel, rating, servesBreakfast} = data;
    overlay_google_link_element.href = `https://www.google.com/maps/search/?api=1&query=Google&query_place_id=${id}`;
    overlay_display_name_element.textContent = displayName;
    overlay_location_lng_element.textContent = (Math.round(location.lng * 1000) / 1000).toString();
    overlay_location_lat_element.textContent = (Math.round(location.lat * 1000) / 1000).toString();
    overlay_business_status_element.textContent = businessStatus;
    overlay_national_phone_number_element.textContent = nationalPhoneNumber;
}

async function init() {
    const element = document.getElementById("key")

    if (!element) {
        return;
    }

    const key = element.getAttribute("data-key");

    // Creates the global `google` variable
    (g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
        key: key,
        v: "weekly",
        // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
        // Add other bootstrap parameters as needed, using camel case.
    });

    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
    const { Place, SearchNearbyRankPreference } = await google.maps.importLibrary("places");

    let map;
    async function initMap() {
        // The location of Austin, TX.
        const position = new google.maps.LatLng(30.2672, -97.7431);

        map = new Map(
            document.getElementById('map'),
            {
                zoom: 5,
                center: position,
                mapId: 'DEMO_MAP_ID',
            }
        );

        new AdvancedMarkerElement({
            map,
            position: position.location,
            title: position.displayName,
        });

        // const places = fakeDB

        const request = {
            // required parameters
            fields: ["displayName", "location", "businessStatus", "postalAddress", "websiteURI", "nationalPhoneNumber", "editorialSummary"],
            locationRestriction: {
                center: position,
                radius: 5000,
            },
            // optional parameters
            includedPrimaryTypes: ["restaurant"],
            language: "en-US",
            region: "us",
        };

        const { places } = await Place.searchNearby(request);

        if (places.length) {
            const test = places.map(e => ({
                    address: e.postalAddress.addressLines[0],
                    latitude: e.location.lat(),
                    longitude: e.location.lng(),
                    phone: e.nationalPhoneNumber,
                    website: e.websiteURI,
                    description: e.editorialSummary,
                    name: e.displayName,
            }));

            console.log(test)

            const { LatLngBounds } = await google.maps.importLibrary("core");
            const bounds = new LatLngBounds();

            places.forEach((place) => {
                const markerView = new AdvancedMarkerElement({
                    map: map,
                    position: place.location,
                    title: place.displayName,
                });

                markerView.element.setAttribute("data-restaurant-id", place.id);
                markerView.addEventListener("click", (e) => {
                    const data = e.target.getAttribute("data-restaurant-id");
                    setPlaceDetails(data);
                })

                bounds.extend(place.location);
            });

            map.fitBounds(bounds);
        } else {
            console.log("No results");
        }
    }

    await initMap();
}

await init()