document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const favePlaceSubmit = (event) => {

    event.preventDefault();

    const favePlaces = document.querySelector(".favorite-input");
    const favorite = favePlaces.value;
    favePlaces.value = "";

    const addLi = document.createElement("li");
    addLi.textContent = favorite;

    const faveList = document.getElementById("sf-places");
    faveList.appendChild(addLi);
  };

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", favePlaceSubmit);



  // adding new photos

  const photoSubmit = (event) => {
    evenet.preventDefault();

    // I don't understand the toggle form part! Confused...
  }

  const photoSubmission = document.querySelector(".photo-url-submit");
  photoSubmission.addEventListener("click", photoSubmit);

});
