<%-- 
    Document   : productView
    Created on : Oct 16, 2022, 7:30:29 PM
    Author     : LHA_21MR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="components/headerCustomer.jsp">
        <jsp:param name="acc" value="${sessionScope.acc.user}"/>
    </jsp:include>
    <div style="display: flex;flex-direction: column;width: 100%; height: 100%;">
        <div style="display: flex;flex-direction: row;width: 100% ; padding: 10px;">
            <div style="margin-right: 10px;margin-left: 20%; width: 10%;">
                <button  style="background-color: rgb(106, 106, 238); color:white ; width:100%">Button</button>
            </div>
            <div style="width: 50%;">
                <input style="width: 100%" placeholder="Search" />
            </div>
        </div>
        <div style="padding: 10px;">
            <div style="margin-left: 20%">Home > New Product</div>
        </div>
        <div style="display: flex;flex-direction: row;margin-top: 20px;">
            <div style="margin-left:20% ;width: 40% ; display: flex; flex-direction: row;">

                <div style="width: 50%;margin-right: auto; display: flex; flex-direction: column;">
                    <div style="display: flex; flex-direction: row;">
                        <div style="font-size: 10px ; margin-top: auto; margin-bottom: auto; margin-right: auto;"> < </div>
                        <img style="width: 80% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>
                        <div style="font-size: 10px ; margin-top: auto; margin-bottom: auto; margin-left: auto;"> > </div>

                    </div>
                    <div style=" display: grid;
                         grid-template-columns: auto auto auto;
                         padding: 10px;">
                        <div style=" 

                             margin: 10px;

                             font-size: 30px;
                             text-align: center;">
                            <img style="width:100% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>


                        </div>
                        <div style=" 
                             margin: 10px;

                             text-align: center;">
                            <img style="width: 100% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>


                        </div>
                        <div style=" 

                             margin: 10px;
                             font-size: 30px;
                             text-align: center;">
                            <img style="width: 100% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>


                        </div>
                        <div style=" 

                             margin: 10px;

                             font-size: 30px;
                             text-align: center;">
                            <img style="width: 100% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>


                        </div>
                        <div style=" 

                             margin: 10px;

                             font-size: 30px;
                             text-align: center;">
                            <img style="width: 100% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>


                        </div>
                        <div style=" 
                             margin: 10px;

                             font-size: 30px;
                             text-align: center;">
                            <img style="width: 100% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>


                        </div>
                    </div>

                </div>

                <div style="width: 40%; display: flex; flex-direction: column;">
                    <div style="margin-bottom: 20px"> 
                        Product Code
                    </div>
                    <div style="margin-bottom: 20px"> 

                        Product name
                    </div>
                    <div style="margin-bottom: 20px"> 

                        Product infor
                    </div>
                    <div>
                        Price
                    </div>
                    <div style="display: flex; flex-direction: row ; padding: 10px; margin-top: 50px;">
                        <button style="background-color: black; color: white; width:40%; margin-right: auto;" >
                            Add to cart
                        </button>
                        <button style="background-color: black; color: white; width:40%;">
                            Buy now
                        </button>
                    </div>
                </div>

            </div>
            <div style="margin-left:1% ;width : 18% ; display: flex; flex-direction: column; ">
                <div style="margin-bottom:30px"> Other product</div>
                <div style="display: flex; flex-direction: row; margin-bottom: 15px;">
                    <img style="width:20% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>
                    <div style="margin-top: auto; margin-bottom: auto; margin-left: 10px"> Product Name</div>
                </div>
                <div style="display: flex; flex-direction: row; margin-bottom: 15px;">
                    <img style="width:20% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>
                    <div style="margin-top: auto; margin-bottom: auto; margin-left: 10px"> Product Name</div>
                </div>
                <div style="display: flex; flex-direction: row; margin-bottom: 15px;">
                    <img style="width:20% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>
                    <div style="margin-top: auto; margin-bottom: auto; margin-left: 10px"> Product Name</div>
                </div>
                <div style="display: flex; flex-direction: row; margin-bottom: 15px;">
                    <img style="width:20% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>
                    <div style="margin-top: auto; margin-bottom: auto; margin-left: 10px"> Product Name</div>
                </div>
                <div style="display: flex; flex-direction: row; margin-bottom: 15px;">
                    <img style="width:20% ; height: auto;" src="https://tronhouse.com/assets/data/editor/source/meo-chup-hinh-anh-mat-kinh-thoi-trang-doc-dao-hap-dan-khach-hang/chup-hinh-mat-kinh.jpg"/>
                    <div style="margin-top: auto; margin-bottom: auto; margin-left: 10px"> Product Name</div>
                </div>

            </div>
        </div>

    </div>
</html>
</DOCTYPE>
