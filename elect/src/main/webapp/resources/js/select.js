function validateSearch() {
    var keyword = document.getElementsByName("keyword")[0].value.trim();
    if (keyword === "") {
        alert("검색어를 입력해주세요.");
        return false;
    }
    return true;
}