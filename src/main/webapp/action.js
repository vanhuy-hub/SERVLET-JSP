const list_group_item=Array.from(document.querySelectorAll(".list-group-item"));
let active_group_item=list_group_item[0];
list_group_item.forEach(group_item=>{

    group_item.onclick=function(){
        active_group_item.classList.remove("active");
        this.classList.add("active");
        active_group_item=this;
    }
});
