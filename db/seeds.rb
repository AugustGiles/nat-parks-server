require 'open-uri'

states = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY', 'DC']


Park.destroy_all
State.destroy_all
ParkState.destroy_all

# LOOP THROUGH EACH STATE AND FETCH ITS PARKS
states.each do |state|

  url="https://developer.nps.gov/api/v1/parks?api_key=KRC7GQJ0JJ5LC5agmTbZJkz1GhGRAbLAlnrVlzRB&fields=images&stateCode=#{state}"

  data = JSON.parse(open(url).read)

  # Create a park, find or create state with the park, create images with park id as fk
  data["data"].each do |el|
    if el["latLong"] != "" && el["designation"] != ""
      bad_lat_long = el["latLong"].split(", ")
      lat = bad_lat_long[0].split(':')[1]
      long = bad_lat_long[1].split(':')[1]

      image_sources = []
      image_titles = []

      el["images"].each do |image|
        image_sources.push(image["url"])
        image_titles.push(image["title"])
      end


      park = Park.find_or_create_by(
        api_id: el["id"],
        description: el["description"],
        designation: el["designation"],
        full_name: el["fullName"],
        coordinates: [long, lat],
        url: el["url"],
        weather_info: el["weatherInfo"],
        image_sources: image_sources,
        image_titles: image_titles
      )
      

      foundState = State.find_or_create_by(name: state)
      foundState.parks.push(park)

    end
  end
end
