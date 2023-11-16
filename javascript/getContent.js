function getContent(){
  var currentURL = window.location.href;
  var baseUrl =  "http://15.164.221.192:8080/postWeb/page/loggedInPage.jsp"

  var table = document.createElement("table");
  table.className = "table"
  var headerRow = document.createElement("tr");
  table.appendChild(headerRow);

  var headerTableRows = ["No", "작성자", "제목", "작성 시간"];
  headerTableRows.forEach((headerTableRow)=>{
    var headerCell = document.createElement("th");
    headerCell.className = "headerCell"
    headerCell.textContent = headerTableRow;
    headerRow.appendChild(headerCell);
  })
  for (var i = 0; i < titleList.length; i++) {
    var row = document.createElement("tr");
    var tableDatas = {
      No: (i + 1).toString(),
      작성자: nameList[i],
      제목: titleList[i],
      작성시간: dateList[i].replace(/:[0-9]{2}$/, ''),
    };
  var idx = idxList
  Object.values(tableDatas).forEach((tableData)=>{
  var cell = document.createElement("td");
  cell.className = "cell"
  if(tableData === titleList[i]){
    var title = document.createElement("a");
    if(currentURL == baseUrl){
      title.href = "../action/getContentAction.jsp?idx="+ idx[i];
    }else{
      title.href = "./action/getContentAction.jsp?idx="+ idx[i];
    }
    
    title.textContent = tableData;
    cell.appendChild(title);
  }else{
    cell.textContent = tableData;
  }
    row.appendChild(cell);
  })
    table.appendChild(row);
  }
  var tableContainer = document.querySelector(".tableSection");
  tableContainer.appendChild(table);
}
getContent()