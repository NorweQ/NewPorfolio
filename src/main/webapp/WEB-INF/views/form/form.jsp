<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="formHeader.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form action="form-confirmation.html" method="post">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>

                <div action="#" method="post">
                    <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="checkbox" name="categories" value="${category.id}"/>
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                    </div>
                    </c:forEach>

                    <div class="form-group form-group--buttons">
                        <button type="submit" class="btn next-step">Dalej</button>
                    </div>
                </div>
            </div>

                    <!-- STEP 2 -->
                    <div data-step="2">
                        <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                        <div class="form-group form-group--inline">
                            <label>
                                Liczba 60l worków:
                                <input type="number" name="quantity" step="1" min="1"/>
                            </label>
                        </div>

                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="button" class="btn next-step">Dalej</button>
                        </div>
                    </div>


                    <!-- STEP 4 -->
                    <div data-step="3">
                        <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                        <c:forEach items="${institutions}" var="institution">
                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="radio" name="institution" value="${institution.name}"/>
                                    <span class="checkbox radio"></span>
                                    <span class="description">
                                        <div class="title">Fundacja “${institution.name}”</div>
                                        <div class="subtitle">
                                        Cel i misja: ${institution.description}
                                        </div>
                                    </span>
                                </label>
                            </div>
                        </c:forEach>

                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="button" class="btn next-step">Dalej</button>
                        </div>
                    </div>

                    <!-- STEP 5 -->
                    <div data-step="4">
                        <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                        <div class="form-section form-section--columns">
                            <div class="form-section--column">
                                <h4>Adres odbioru</h4>
                                <div class="form-group form-group--inline">
                                    <label> Ulica <input type="text" name="street"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label> Miasto <input type="text" name="city"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label>
                                        Kod pocztowy <input type="text" name="zipCode"/>
                                    </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label>
                                        Numer telefonu <input type="tel" name="phone"/>
                                    </label>
                                </div>
                            </div>

                            <div class="form-section--column">
                                <h4>Termin odbioru</h4>
                                <div class="form-group form-group--inline">
                                    <label> Data <input type="date" name="pickUpDate"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label> Godzina <input type="time" name="pickUpTime"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label>
                                        Uwagi dla kuriera
                                        <textarea name="pickUpComment" rows="5"></textarea>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="button" id="nextButton" class="btn next-step">Dalej</button>
                        </div>
                    </div>

                    <!-- STEP 6 -->
                    <div data-step="5">
                        <h3>Podsumowanie Twojej darowizny</h3>

                        <div class="summary">
                            <div class="form-section">
                                <h4>Oddajesz:</h4>
                                <ul>
                                    <li id="summaryBags">
                                        <span class="icon icon-bag"></span>
                                        <span class="summary--text">4 worki ubrań w dobrym stanie dla dzieci</span>
                                    </li>

                                    <li id="summaryInstitution">
                                        <span class="icon icon-hand"></span>
                                        <span class="summary--text">Dla fundacji "Mam marzenie" w Warszawie</span>
                                    </li>
                                </ul>
                            </div>

                            <div class="form-section form-section--columns">
                                <div class="form-section--column">
                                    <h4>Adres odbioru:</h4>
                                    <ul>
                                        <li id="summaryStreet">Prosta 51</li>
                                        <li id="summaryCity">Warszawa</li>
                                        <li id="summaryZipCode">99-098</li>
                                        <li id="summaryPhone">123 456 789</li>
                                    </ul>
                                </div>

                                <div class="form-section--column">
                                    <h4>Termin odbioru:</h4>
                                    <ul>
                                        <li id="summaryPickUpDate">13/12/2018</li>
                                        <li id="summaryPickUpTime">15:40</li>
                                        <li id="summaryPickUpComment">Brak uwag</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="submit" class="btn">Potwierdzam</button>
                        </div>
                    </div>
                </form>
            </div>
</section>

<%@ include file="formFooter.jsp" %>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Znajdź przycisk "Dalej" po id
        var nextButton = document.getElementById("nextButton");

        // Nasłuchuj zdarzenia kliknięcia na przycisku "Dalej"
        nextButton.addEventListener("click", function () {
            // Pobierz wartości z formularza
            var bags = document.querySelector("input[name='quantity']").value;
            var institution = document.querySelector("input[name='institution']:checked").value;
            var street = document.querySelector("input[name='street']").value;
            var city = document.querySelector("input[name='city']").value;
            var zipCode = document.querySelector("input[name='zipCode']").value;
            var phone = document.querySelector("input[name='phone']").value;
            var pickUpDate = document.querySelector("input[name='pickUpDate']").value;
            var pickUpTime = document.querySelector("input[name='pickUpTime']").value;
            var pickUpComment = document.querySelector("textarea[name='pickUpComment']").value;

            // Aktualizuj podsumowanie
            document.getElementById("summaryBags").innerHTML = '<span class="icon icon-bag"></span><span class="summary--text">' + bags + ' worków z darami</span>';
            document.getElementById("summaryInstitution").innerHTML = '<span class="icon icon-hand"></span><span class="summary--text">Dla fundacji "' + institution + '" </span>';
            document.getElementById("summaryStreet").textContent = street;
            document.getElementById("summaryCity").textContent = city;
            document.getElementById("summaryZipCode").textContent = zipCode;
            document.getElementById("summaryPhone").textContent = phone;
            document.getElementById("summaryPickUpDate").textContent = pickUpDate;
            document.getElementById("summaryPickUpTime").textContent = pickUpTime;
            document.getElementById("summaryPickUpComment").textContent = pickUpComment;

            // Przełącz do następnego kroku
            var currentStep = nextButton.closest("[data-step]");
            var nextStep = currentStep.nextElementSibling;
            currentStep.classList.remove("active");
            nextStep.classList.add("active");
        });
    });
</script>