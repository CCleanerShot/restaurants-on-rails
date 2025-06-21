async function init() {
    const element = document.getElementById("key")

    if (!element) {
        return;
    }

    const key = element.getAttribute("data");

    (g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
        key: key,
        v: "weekly",
        // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
        // Add other bootstrap parameters as needed, using camel case.
    });

    let map;
    async function initMap() {
        // The location of Austin, TX.
        const { Map } = await google.maps.importLibrary("maps");
        const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
        const { Place, SearchNearbyRankPreference } = await google.maps.importLibrary("places");

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

        // Restrict within the map viewport.
        const request = {
            // required parameters
            fields: ["displayName", "location", "businessStatus", "nationalPhoneNumber", "postalAddress", "priceLevel", "rating", "servesBreakfast"],
            locationRestriction: {
                center: position,
                radius: 5000,
            },
            // optional parameters
            includedPrimaryTypes: ["restaurant"],
            rankPreference: SearchNearbyRankPreference.POPULARITY,
            language: "en-US",
            region: "us",
        };

        const { places } = await Place.searchNearby(request);

        if (places.length) {
            const { LatLngBounds } = await google.maps.importLibrary("core");
            const bounds = new LatLngBounds();

            // Loop through and get all the results.
            places.forEach((place) => {
                const markerView = new AdvancedMarkerElement({
                    map,
                    position: place.location,
                    title: place.displayName,
                });

                bounds.extend(place.location);
                console.log(place);
            });
            map.fitBounds(bounds);
        } else {
            console.log("No results");
        }
    }

    await initMap();
}

await init()