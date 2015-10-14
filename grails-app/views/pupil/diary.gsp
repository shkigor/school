<%--
  Created by IntelliJ IDEA.
  User: igor
  Date: 15.10.15
  Time: 1:04
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Дневник</title>
</head>
<body>
<div class="body">
    <g:link action="diary" params="[d:prevdate]">Предыдущяя неделя</g:link>
    <g:link action="diary" params="[d:nextdate]">Следующая неделя</g:link>
    <table>

        <!-- проставляем предметы и оценки в соответствии с днями недели -->
        <tr>
            <td>ПН<br/><g:formatDate format="dd.MM" date="${date}"/></td>
            <td>
                <table>
                    <g:each in="${pn}">
                        <tr>
                            <td class="diary">
                                ${it.subject.name}
                            </td>
                            <td class="diary">
                                ${it.mark}
                            </td>
                        </tr>
                    </g:each>
                </table>
            </td>
            <td>ЧТ<br/><g:formatDate format="dd.MM" date="${date+3}"/></td>
            <td>
                <table>
                    <g:each in="${cht}">
                        <tr>
                            <td class="diary">
                                ${it.subject.name}
                            </td>
                            <td class="diary">
                                ${it.mark}
                            </td>
                        </tr>
                    </g:each>
                </table>
            </td>
        </tr>
        <tr>
            <td>ВТ<br/><g:formatDate format="dd.MM" date="${date+1}"/></td>
            <td>
                <table>
                    <g:each in="${vt}">
                        <tr>
                            <td class="diary">
                                ${it.subject.name}
                            </td>
                            <td class="diary">
                                ${it.mark}
                            </td>
                        </tr>
                    </g:each>
                </table>
            </td>
            <td>ПТ<br/><g:formatDate format="dd.MM" date="${date+4}"/></td>
            <td>
                <table>
                    <g:each in="${pt}">
                        <tr>
                            <td class="diary">
                                ${it.subject.name}
                            </td>
                            <td class="diary">
                                ${it.mark}
                            </td>
                        </tr>
                    </g:each>
                </table>
            </td>
        </tr>
        <tr>
            <td>СР<br/><g:formatDate format="dd.MM" date="${date+2}"/></td>
            <td>
                <table>
                    <g:each in="${sr}">
                        <tr>
                            <td class="diary">
                                ${it.subject.name}
                            </td>
                            <td class="diary">
                                ${it.mark}
                            </td>
                        </tr>
                    </g:each>
                </table>
            </td>
            <td>СБ<br/><g:formatDate format="dd.MM" date="${date+5}"/></td>
            <td>
                <table>
                    <g:each in="${sb}">
                        <tr>
                            <td class="diary">
                                ${it.subject.name}
                            </td>
                            <td class="diary">
                                ${it.mark}
                            </td>
                        </tr>
                    </g:each>
                </table>
            </td>
        </tr>

    </table>
</div>
</body>
</html>