<%-- 
    Document   : admin
    Created on : May 30, 2023, 11:08:02 AM
    Author     : ASUS
--%>

<%@page import="user.UserDAO"%>
<%@page import="shopping.Laptop"%>
<%@page import="shopping.Cart"%>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
            }

            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }

            .pagination a:hover:not(.active) {background-color: #ddd;}
            *{
                color:black;
            }
        </style>

    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            String pageNumber = request.getParameter("pageNumber");
            if (pageNumber == null) {
                pageNumber = "1";
            }
        %>
        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            UserDAO dao = new UserDAO();
            if (listUser == null) {
                listUser = dao.getListUser("", "1");
            }
            if (listUser != null) {
                if (!listUser.isEmpty()) {
        %>
        <div id="root">
            <nav
                class="md:left-0 md:block md:fixed md:top-0 md:bottom-0 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-xl bg-white flex flex-wrap items-center justify-between relative md:w-64 z-10 py-4 px-6"
                >
                <div
                    class="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center justify-between w-full mx-auto"
                    >
                    <a
                        class="md:block text-left md:pb-2 text-blueGray-600 mr-0 inline-block whitespace-nowrap text-sm uppercase font-bold p-4 px-0"
                        href="javascript:void(0)"
                        >
                        Admin Dashboard
                    </a>

                    <div
                        class="md:flex  md:flex-col md:items-stretch md:opacity-100 md:relative md:mt-4 md:shadow-none shadow absolute top-0 left-0 right-0 z-40 overflow-y-auto overflow-x-hidden h-auto items-center flex-1 rounded hidden"
                        id="example-collapse-sidebar"
                        >
                        <form class="mt-6 mb-4 md:hidden">
                            <div class="mb-3 pt-0">
                                <input
                                    type="text"
                                    placeholder="Search"
                                    class="border-0 px-3 py-2 h-12 border border-solid  border-blueGray-500 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-base leading-snug shadow-none outline-none focus:outline-none w-full font-normal"
                                    />
                            </div>
                        </form>
                        <ul class="md:flex-col md:min-w-full flex flex-col list-none">
                            <li class="items-center">
                                <a
                                    class="text-green-500 hover:text-green-600 text-xs uppercase py-3 font-bold block"
                                    href="admin.jsp"
                                    ><i class="fas fa-users opacity-75 mr-2 text-sm"></i>
                                    User</a
                                >
                            </li>
                            <li class="items-center">
                                <a
                                    class="text-blueGray-700 hover:text-blueGray-500 text-xs uppercase py-3 font-bold block"
                                    href="productAdmin.jsp"
                                    ><i class="fas fa-tv text-blueGray-400 mr-2 text-sm"></i>
                                    LapTop</a
                                >
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="relative md:ml-64">
                <nav
                    class="sticky  top-0 left-0 w-full z-10 md:flex-row md:flex-nowrap md:justify-start flex items-center p-4 bg-green-500"
                    >
                    <div
                        class="w-full mx-autp items-center flex justify-between md:flex-nowrap flex-wrap md:px-10 px-4"
                        >
                        <a
                            class=" text-sm uppercase hidden lg:inline-block font-semibold"
                            href="./index.html"
                            >Welcome:  ${sessionScope.LOGIN_USER.fullName}</a
                        >
                        <form
                            class="md:flex hidden flex-row flex-wrap items-center lg:ml-auto mr-3"
                            >
                            <div class="relative flex w-full flex-wrap items-stretch">
                                <span
                                    class="z-10 h-full leading-snug font-normal absolute text-center text-blueGray-300 absolute bg-transparent rounded text-base items-center justify-center w-8 pl-3 py-3"
                                    ><i class="fas fa-search"></i
                                    ></span>
                                <input
                                    type="text"
                                    placeholder="Search here..."
                                    class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 relative bg-white bg-white rounded text-sm shadow outline-none focus:outline-none focus:ring w-full pl-10"
                                    />
                            </div>
                        </form>
                        <ul
                            class="flex-col md:flex-row list-none items-center hidden md:flex"
                            >
                            <a class="text-blueGray-500 block" href="#pablo" onclick="openDropdown(event, 'user-dropdown')">
                                <div class="items-center flex">
                                    <span
                                        class="w-12 h-12 text-sm text-white bg-blueGray-200 inline-flex items-center justify-center rounded-full"
                                        ><img
                                            alt="..."
                                            class="w-full rounded-full align-middle border-none shadow-lg"
                                            src="./img/user.png"
                                            /></span>
                                </div>
                            </a>
                            <div
                                class="hidden bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg mt-1"
                                style="min-width: 12rem;"
                                id="user-dropdown"
                                >
                                <a
                                    href="MainController?action=Logout"
                                    class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700"
                                    >Logout</a
                                >
                            </div>
                        </ul>
                    </div>
                </nav>
                <section class="manage-product-section px-4 md:px-10 mx-auto w-full">
                    <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <span style="color:red; padding:10px; margin: 10px 0;"> <%= error%></span>
                    <table border="1" class="w-full border-collapse bg-white text-left text-sm text-gray-50 mt-1">
                        <thead class="bg-green-400">
                            <tr>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">No</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">UserID</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Fullname</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Role ID</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Password</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Status</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Action</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                            <%                             int count = 1 + (Integer.parseInt(pageNumber) - 1) * 10;
                                for (UserDTO user : listUser) {
                            %>
                        <form action="MainController" method="POST">
                            <tr class="hover:bg-gray-50">
                                <td class="py-2 "><%= count++%></td>
                                <td class="py-2"><input type="text" name="userID" value="<%= user.getUserID()%>"  readonly=""/></td>
                                <td class="py-2"><input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/></td>
                                <td class="py-2"><input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/></td>
                                <td class="py-2"><%= user.getPassword()%></td>
                                <td class="py-2"><%= user.getStatus()%></td>
                                <td>
                                    <div class="flex gap-4 justify-center">
                                        <a x-data="{ tooltip: 'Delete' }" href="MainController?userID=<%=user.getUserID()%>&action=Delete&search=<%= search%>">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke-width="1.5"
                                                stroke="currentColor"
                                                class="h-6 w-6"
                                                x-tooltip="tooltip"
                                                >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
                                                />
                                            </svg>
                                        </a>
                                        <button x-data="{ tooltip: 'Edite' }" href="#" type="submit" name="action" value="Update">
                                            <input type="hidden" name="search" value="<%= search%>">
                                            <input type="hidden" name="search" value="<%= search%>">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke-width="1.5"
                                                stroke="currentColor"
                                                class="h-6 w-6"
                                                x-tooltip="tooltip"
                                                >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"
                                                />
                                            </svg>
                                    </div>
                                </td>
                            </tr>
                        </form>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <%
                            }
                        }
                    %>
                </section>
                <section class="flex justify-end items-center mx-5 my-3">
                    <nav aria-label="Page navigation example">
                        <ul class="inline-flex items-center -space-x-px pagination">
                            <li>
                                <a href="MainController?search=&action=Search&pageNumber=1" class="block px-3 py-2 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700">
                                    <span class="sr-only">Previous</span>
                                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
                                </a>
                            </li>
                            <%
                                for (int i = 1; i < 5; i++) {
                                    String isActive = Integer.parseInt(pageNumber) == i ? "bg-green-500" : "";
                            %>    
                            <li>
                                <a href="MainController?search=<%= search%>&action=Search&pageNumber=<%=i%>" class="px-3 py-2 leading-tight text-gray-500  border border-gray-300 hover:bg-gray-100 hover:text-gray-700 <%=isActive%>"><%= i%></a>
                            </li>
                            <%
                                }
                            %>
                            <li>
                                <a href="#" class="block px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700">
                                    <span class="sr-only">Next</span>
                                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </section>
            </div>
        </div>


        <script type="text/javascript">
        /* Sidebar - Side navigation menu on mobile/responsive mode */
        function toggleNavbar(collapseID) {
            document.getElementById(collapseID).classList.toggle("hidden");
            document.getElementById(collapseID).classList.toggle("bg-white");
            document.getElementById(collapseID).classList.toggle("m-2");
            document.getElementById(collapseID).classList.toggle("py-3");
            document.getElementById(collapseID).classList.toggle("px-6");
        }
        /* Function for dropdowns */
        function openDropdown(event, dropdownID) {
            let element = event.target;
            while (element.nodeName !== "A") {
                element = element.parentNode;
            }
            var popper = Popper.createPopper(element, document.getElementById(dropdownID), {
                placement: "bottom-end"
            });
            document.getElementById(dropdownID).classList.toggle("hidden");
            document.getElementById(dropdownID).classList.toggle("block");
        }
    </script>
    </body>
</html>
