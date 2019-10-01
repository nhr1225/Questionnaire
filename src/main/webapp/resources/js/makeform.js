  $(document).ready(function(){
                $("#btn1_plus").click(function(){
                let items =1;
                let form_table = "";
                    form_table =`<table class="table table-striped">
                                    <thead>
                                      <tr>
                                           <th style="text-align: center;">질 문</th>
                                             <th><input class="form-control" type="text" placeholder="질문을 입력하시오"></th>
                                           <th style="display: table-cell; text-align: center;">
                                           <button type="button" class="btn1_minus" id="btn1_minus" >
                                                <span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span>
                                           </button></th>
                                      </tr>
                                   <tbody>
                                    <tr>
                                     <td>옵 션${items++}</td>
                                     <td><input class="form-control" type="text" placeholder="옵션을 입력하시오"></td>
                                      <td>
                                        <button type="button" class="btn2_plus">
                                            <span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true"></span>
                                        </button>
                                      </td>
                                     </tr>
                                    </tbody>
                                </table>`;
                    $(".option_table").eq(0).append(form_table);
                    
                     $(".btn1_minus").click(function(){
                        let indexs = $(".btn1_minus").index(this);
                        console.log("Index = ",indexs);
                        var i = indexs+1;
                        if(i > 0){
                            document.getElementsByTagName("table")[i].remove();
                        }

                    });
                
                    $(".btn2_plus").off().click(function(){
                      btn2plus(this);
                        
                        $(".btn2_minus").click(function(){
                        let m_indexs = $(".btn2_minus").index(this);
                        console.log("m_Index = ",m_indexs);
                        if(m_indexs > -1){
                            $("table tbody #sub_option")[m_indexs].remove();
                        }
                      });
                    });
                    
                   
                    
                   function btn2plus(prop){
                let items=11;
                let form_option_plus ="";
                      form_option_plus += '<tr id="sub_option">'
                      form_option_plus +=  `<td>옵 션</td>`
                      form_option_plus +=   '<td><input class="form-control"  type="text" placeholder="옵션을 입력하시오"></td>'
                      form_option_plus +=   '<td>' 
                      form_option_plus +=    '<button type="button" class="btn2_minus"><span class="glyphicon glyphicon glyphicon-minus" aria-hidden="true"></span></button>'
                      form_option_plus +=  '</td>'
                      form_option_plus += '</tr>';
                    let index = $(".btn2_plus").index(prop);
                    console.log(index);
                    $("table tbody").eq(index).append(form_option_plus);
                console.log($("table tbody").eq(index));
            }
                
            });
     });