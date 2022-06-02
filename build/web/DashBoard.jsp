

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Favicon-->
        <link rel="icon" type="image/png" href="img/logo.PNG" />

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

     <title>Flower shop</title>
    </head>
    <body>

        <a class="nav-link" href="logout" style="position: fixed; right: 10px;">LogOut</a>

        <div class="container">
            <div class="row">
                <div class="col-3">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light flex-column">
                        <a class="navbar-brand" href="dashBoard"><img src="https://sp-ao.shortpixel.ai/client/q_glossy,ret_img/https://lambanner.com/wp-content/uploads/2020/04/MNT-DESIGN-10-MEO-THIET-KE-LOGO-1130x570.jpg" width="200px" height="200px"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="home">Home</a>
                            </li>
                            <c:if test="${sessionScope.acc == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="login">Đăng nhập</a>
                                </li>
                            </c:if>
                            <c:if test = "${sessionScope.acc != null}">
                                <li class="nav-item">
                                    <a class="nav-link text-info" href="login">Xin chào ${sessionScope.acc.user}</a>
                                </li>
                                <c:if test="${sessionScope.acc.isSell == 1}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="manager">Quản lí sản phẩm</a>
                                    </li> 
                                </c:if>
                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="accountManager">Quản lí tài khoản</a>
                                    </li> 
                                </c:if>
                            </c:if>

                            <li class="nav-item">&nbsp;
                            </li> 
                        </ul>
                    </nav>
                </div>
                <div class="col-6">
                    <section class="jumbotron text-center" style="background-color: white;">
                        <div class="container">
                            <h1 class="jumbotron-heading"><img src="img/logo.PNG" alt="Main Logo" width="70%"/></h1>
                            <p class="lead text-muted mb-0">Hoa sẽ đem lại hạnh phúc cho mọi nhà</p>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="data:image/jpeg;base64,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" alt="..." width="70%;">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Accounts</h5>
                                    <h5 class="card-title">${totalAccount}</h5>
                                    <p class="card-text"><small class="text-muted">Last updated 2 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="data:image/jpeg;base64,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" alt="..." width="70%;">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Products</h5>
                                    <h5 class="card-title">${totalProduct}</h5>
                                    <p class="card-text"><small class="text-muted">Last updated 2 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOYAAADbCAMAAABOUB36AAABblBMVEX////19fXc3Nz8/PyIiIj49/bD1erQz83L3PHh4eHx8fEAAADk5OTt7e3X5PTv8vXCwsJvcnxLUV/Exck/RVXXxLRjfpgzAAAAEi6PdlusrrMAN1v///v6///MzdCVlZWysrIrAACkpqzt6eb///Ps9f/68ufU1NeBhI0+Pj7b4ee8uLaenJnMxsHf2NPM3Of/+OTM0tnt+/6CZUZtiKEAH01iQBKxxddOa4V1Y1VNX2wYAAAAAA9SPSyVrsCqrLLDr5q2yt09TV0pSmZBJgB9jpq+tKgAACwAHUHu3ssDK0hkSzC+qpUiLzxRUkOWfGPW39arl4GRp70kLEFBAAA/W3cqMkUhAAATHjcALVQkLDQ8NCsAACCWoKyQhX2vophmVEF6b22hkY2ssaiNmp2Fgny+yMGTgYX96tWpqKS3vLHK0MXg6952goyEg5eJkpRoU1Cgo5GVl7CckYCLjofdysKwwse4qaCrw9x0dX5FxGZCAAAOWUlEQVR4nO2di2ObSH7HB/CYgMDgznofBAEHEtIxDA5OWl9ur1Fyd1FPba7n3fR227sqbuysrzhO3CRne/3fd5D8kBDIliLJBvOVrcfAoPkwM7/5zUMAwB3RveXC6x7FXNZhwaUvx5iQKbhgiVkglZhF0hhMblS5PR3ZmMI/jErNK2c2JvuFwA5LONW4hScwVUPlCg4VsvSMGIfJJdpYrrlYTFGWoSzH7+gbqfem9xkEluWBXjB94nhLU7j4Q09iKudYzETIgjG5tcqvwMPKI52pVf4R/FNlE/aCuNrjCtWv6xB++5s6dP85/rTJcQ8rPT1JTeJkmK0FY34JvqlU1mHtF/fB08qXHEOpn9H/34bB48rvAPzq63rt95XnbLtSWaF7vvNN0ww/LzchrQOawTG0JNO/jCowU51j/hnEmG7lXzag++0fqp3Kv1apk/pvlWf6V19vUHoAwYs/HtM9YxQwRd2Mt5+xQktsyA2zIZsqsluIaUhzwztXH/M3/17Z1ClmnJE05BF4UXlE08TRlxjzT3FZZjgAuW8qT3ieN9KPdQUmZzf7nFyzqxpN0DTQKmiCQ8Fm556fZ7m5Vfm6+tV9wMX59rCyzn1X+T5O2NMeZpXC9xNCMXuqT1FoOe3ly0PQO8ohaiIb2MZpN8bUmgvD3Piu8vw/7gPGrfyhVrlfHcbc+KaXm7QeUczn2KJGN/VY4zAh13r5xRcvD+P85EywKpi2zSJbOgRdxloYpqf/vvItxaRZuUQJaeif6YmnG57EmLTsAsr8x00a8AxQRy39WGNzE738wZC+eGnHccXYCokMFEVWXKgJ8uhr5X7MQovkCmRqX1WeALAWF09qad0fK0/Eox8pIs1X2tDKk+cmaP2nwUHhhzg7IeJssdEwITJkVZ4v35l6mA8rHtQfVv6LZqBboY1IL7jyl7/GTSX88b/rXKdXI7/Xz+vmlxO3m7QmxoCCGcdkDWQwRgMZBhSNxbi2wdIx127S7HGXunF1bPcbRc559ctfvvM4Bu68UWgDh8039APd2tPx5Cao7zidbbQZmzMM2TagsZjcpEDU7+llzvnzWVI4AHpvz4PPPozpRF3fPZCgwMkSlCRDzl8/ZTJnz+p5DAtI1qx1i33aWWqSjhhYcEdshsrEhOwPBhqWsVpATGl1VOim62XfL4EpyeBih6/3nBovs9DCWzXkFXiyKDKyICuOIpJQTG6H257fiLwXnpnqu+dlADNoYWSpRFOFCDl+ONIN1LfV1qt36v+srK3nGhPxQhgYBs8Sz0WiN7LDGs1NPzwJ/dFNTH4wmUuDn9FyQ67/SI+dF8zPU4l5a3RRVGmHV4YpnV1qghlGgr2+ZvoY1e3HhNgIBIFnG8gxOByEPLVG0pCdgb7v2/hEW3X91affT9jfvC2CbYR2gnDbrmNrA7tWZGDLG2o3oe1jE70WyHNlSdjZSD3IrcdkBEkSYCDTDmADBg2Rl4SGPNxqBB6RBEvAEmwE6Y5aDjB7OqubvadRX2+gqZm0W10olZhFUolZJJWYRdKdwgQpAyKFEuhjFl4lZpFUYhZJJWaRlInpnxg7z6vfbQYSu+AkzUPZmO3d18+rT9dbPrfgJM1DmZhEFVQEgjrx0IKTNA/d9bpZLJWYRVKJWSRlYgYNJV7TxQmcACURyunRX6xHp6zsQV9WgMnKjm07ShB5vKP4jjLHZE+qTEwVdLwdQ1UbLUyQqonp0X/qfjC7n8w3J34XNJ3uh5b9U9R98Sj61IpedeeY7EmViekYIt8Q2AA1VFaQkJAa232G99QwQETjNYDACcIWYRGvInKMSTjPdE+oq+qm3nP1YN4dvrtugoqlTExd6r30SisHAZMaW1fi4gyr9G28A5xLEmeh7B6KKPKsQUIiGmS9c4wC1uA9PtH5fPDoaajxeKsFOk8CzdkJDcLfJstzoUxMrAfeNo8NrHrBSoA1ghGPrcZwrj7onqBt++3e36o40sjxURcfB8eLSPakyi60DSDEvxek7gEnQ06RRJFhnOqwm6DLotiQGbkBFCCIugE90fEWkexJdddNULF01zFrIXCqTvWK6CQ89wJ5IzbCWCLrIFDr1FnsNUjklgwkZfdQaEOBsBbYfDfoZvU2/vde54212412DwFuRH61ZnukCtpv8VJkWbs2eLBM9g93d/1ION23VXWOHFcou0EJNIp57GqyJWhCBqaOrX0Loz2aaUTFe6KOQ1VX2ntqC29Ze0QG2H6r7fH8ltXcI1vP5shxhWZfN+HlKRlufYKrasAcdddNULF01zEJUUPdczxRlrJj69thO4xWatth5O1sRI7Nt5zbNDZyoWxLy6vkOOgSzRgzcvAg3OyoBy1y8LeDZdR5V7V0BPbnlNLPUiamQBt4uSFJgjdu4o9IFoerAFex7gEnCIkBbuU84V2vm8VSiVkklZhFUolZJJWYRVKJWSTddUxzKceKro1ZLGUPR9vHUBkcjnZbSIYK1OLfSFp6V+UUKMv6tMtFOh6CTIBqNhIbjAKHJtqOsAcZmZM7BlnXBzv1ro1YseooDke3uykzjI6pyIGnHNWTGzIxH7z3bf/x+kDCursf/ejQtH374D34v18drUY7zQ+rU45KdtZt0//wsfY+MqM30qvng9uWwGP8/KfIPIyaUXMwxZ3lyH+s2p3up9bf/cPNlMOaa/gUne5OgLkJLNRWL09Z515tk2i427Zxw9aRSUyVaG+nnTxwo1DFql3bBBqxjPZQzhy9srdtHyMr0oTVoUg2wuQ4YiPDj4iWhql1bNU396+PeTvkzmgNVWlpi6QJMOewBorp/fd+rJYmbnT9CuRoIKSPkRjxapf40X9KKBtzZ2P4s2OE217Aqj4KBEkgMqoKEi9hm0xffY668DCwAVGJlbo9sEYGt4m6va5Hexbu8sMbaqcO2cNhe2XtSaCNmP9szKME5lFdVvf4CLVDfx/t45PdOlHjd2+mXyEjf6qTt3ZVVTOmPmnTiBNBgSdbNdTmEfGHv1ePQuJY62t1hxyTRNLHYY7MVBNPlgNBDhT6kPgqqrr1QFKEYPrcdDXguKHoeBnLTwIDJGc2iEebf36DVOXk92IHyURBUApTHIe7boLYPGtkduuu56auJuqxq3q96irF287qkt5/vXLBSYZctSo5CGTWTcA6yWoW0LoJiEKYMLksHStECaBaddEkdRN2EsFHx7z2tkuO96PQ1RSyH6o+3nuPt3xtyxyxbNdTYLvdt8dg2+DTLa2jESMRJKpRWAvbrGVbwyaoZh7Yys7G2gqZyNK6zYQlO9oiLXWJ7+4vhS6/t7Pr7y/hg/fa1pJl706LuWT4QrSBLayl74CDKFFQPq0HFoyM7XV+dzjPaiYi4dHBiUds2kYlDzRd3ZyVP5S+Snc6jV3Mm4l5w1cq+ExdG1MScqyyQUkI4oSRd5HMVwPAVxu6JxjOLNYcBjZjBxogKHMFI0maYIyIB068Ez7putMELik7B1bdsYPWyHHGuO7rw591vLXZNi1hJ8KtvX2UYRsnkuNvYKABlWSuWqwl+d2QaLRB2dKwnWxr9Wjl6CBaIcFEDYqVGFBx1IP3EpZPkMoilp3JClLX3KAHEoMwyOrltJMbaIMRim2lXWeDJGbN9AIRe46WUtImqpvUgOm3cj3MlSpd9yIpG5O7weWvM1c25vaUjuqtVLalXVpPC86psnMT3o1CWyiVDUqRlI2Jb9MP+j9XY2arb+gXinGv+OyCwuLV6l8UEaZ1pQc1piO2wAblHGwg4TB7KOAsyrn611O+jBzHTe59g3Wzf0eO8zw54/rMI/aph48ab4kRmf5tQYajyHOQeH6bqLMzPwu0K5D738X07Mzlx8sTcJ2KcW1RRCmWLF6Ux7mwZSKPnIFB4v7pnu7AlzeJEa9lJG5Gl8X8sqCf1e/zW+VeGgB4bgWG9j7f5aZRJtDgGChM07hB0lLX1NXjzXnTRYkZrAPjfIOBRvam0z5eQ7Y/6SBcIyIcOB0zaoFnpqGWPMt5meKoQy7RUOPFXefMzUoXGXeeY3P9pjPi+F6WQFkZ8LpmT3xRJqmb0L9PfTyZM18l07DSw7xMEbyoI4NN34TUXKLSXDhXvdD0Fmm2SqZoeQhzMKnx/6CpG/AORsx7P5hJ7j61EzVzZWKCtWNraC7inCbrQvhnJ2AhqZ5Y2Zi1kIxOoOVV2Zi6NzLnlF9lYxZKmZjyDY9Bfp6ujVksZWPGC0oXnJj5KRtTxsYNXsdoxsrG3FbwXcAUmQLNid11E1Q2KDlUNiYO14ozLZ+N6YYPbvCKcTNWNqbv1e5CbhZKpaUtkkrMIqnELJJKzFzpivHhnGL6oeyYivta5oPNRmez+vRjpwu2tQ9a5LlNvpl6eYccYr7o2p9aJjDXwtfoVfQMdH5d+whsP4oOWx31FI844znFxAZRrRCoNYvFEY/qnY8AWSTEIWENTWyl/uIvh5hpGlc9C4Q5TnnAZErX/ZoqMW+nIFu9vKeZzjmsEv/cmAY5iqMIEuQAy43eDSx3mJ26ymJRlXmeVRFZB8gxLMniG+DEg8j1TuquFhgjQPnD9FS1zYdBw1ItHq/oKOA10uI9ELTaXnwrOylQ1fx7QZwMOJEWUhmIvWsHMUDRGZm+ERVRgYAGyWD0Tn25w5xOecCcYiFR8hB5wISfv8orD5gzUIl5iwXPL+SjxO4Bd+Ee6JyuAKEI7kEs3Q5IeMJGxvbPtWag/b3RaiPwTfih+6flFz8/OD0yRyZ/8onZfboqLUWt1/hnvXtC3uHTXQ+srUZ2Z/PTk+BoSSsGJnBCERiyHC/pkfTQZQ1ZAIHnKFDRFckAjZEI+cScWHnAZBqT9qpHsjMPmKI6sZKHyAPmDFRiFkklZpFUYhZJJWaRVGIWSSVmkVRiFkh67+oyy/cKLwB8/i7o/wFx6RzXSSTkxQAAAABJRU5ErkJggg==" alt="..." width="70%;" style="margin-top: 10px;">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Total Invoices</h5>
                                    <h5 class="card-title">${totalCart}</h5>
                                    <p class="card-text"><small class="text-muted">Last updated 2 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h3>Sản phẩm bán chạy</h3>
                    <c:forEach var="o" items="${top3MostSellD}">
                        <h6>${o.name}</h6>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                        </div>
                        <br>
                    </c:forEach>
                </div>
                <div class="col-6">
                    <h3>Sản phẩm ít bán chạy</h3>
                    <c:forEach var="o" items="${top3LeastSellD}">
                        <h6>${o.name}</h6>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${o.proportion}%" aria-valuenow="${o.proportion}" aria-valuemin="0" aria-valuemax="100">${o.amount}</div>
                        </div>
                        <br>
                    </c:forEach>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>