<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .mainDiv {
        min-height: 300px;
    }
    
    .modern-font {
        font-family: fantasy;
        font-weight: bold;
        color: white;
    }
    
    .service-image {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        overflow: hidden;
    }
    
    .service-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        padding: 10px;
        margin: 10;
    }
    
    .container-fluid {
        display: flex;
        justify-content: center;
    }
    
    .row {
        align-items: center;
        justify-content: space-between; 
        margin: -25px;
    }
    
    .col-md-3 {
        margin: 25px;
    }
</style>
</head>
<body>

<section class="service-section mt-0 d-flex justify-content-center align-items-center bg-dark" id="services">
    <div class="container-fluid">
    
        <div class="row P-5">
            <div class="col-md-3">
                <h4 class="modern-font m-1">SHARE</h4>
                <div class="service-image">
                    <img src="https://static.jeffbullas.com/wp-content/uploads/2015/05/content-marketing-tips-111.jpg">
                </div>
            </div>

            <div class="col-md-3">
                <h4 class="modern-font">DISCOVER</h4>
                <div class="service-image">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/f/f5/Telescope-123.jpg">
                </div>
            </div>

            <div class="col-md-3">
                <h4 class="modern-font m-1">CONNECT</h4>
                <div class="service-image">
                    <img src="https://www.cvent.com/sites/default/files/styles/focus_scale_and_crop_800x450/public/image/2019-07/networking.jpg?h=67788074&itok=GG5KZUQ3">
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
