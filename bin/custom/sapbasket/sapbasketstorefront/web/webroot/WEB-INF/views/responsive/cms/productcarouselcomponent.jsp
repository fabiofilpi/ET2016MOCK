<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/shared/component"%>

<c:choose>
	<c:when test="${not empty productData}">
		<div class="carousel__component">
			<div class="carousel__component--headline">${title}</div>

			<c:choose>
				<c:when test="${component.popup}">
					<div
						class="carousel__component--carousel js-owl-carousel js-owl-lazy-reference ">

						<c:forEach items="${productData}" var="product">

							<a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
							<c:url value="${product.url}" var="productQuickViewUrl" />
							<div class="carousel__item">
								<a href="${productQuickViewUrl}" class="js-reference-item">
									<div class="carousel__item--thumb">
										<product:productPrimaryReferenceImage product="${product}"
											format="product" />
									</div>
									<div class="carousel__item--name">${product.name}</div>
									<div class="carousel__item--price">
										<format:fromPrice priceData="${product.price}" />
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div
						class="carousel__component--carousel js-owl-carousel js-owl-default">
						<c:forEach items="${productData}" var="product">

							<c:url value="${product.url}" var="productUrl" />

							<div class="carousel__item">

								<a href="${productUrl}">
									<div class="">
										<product:productPrimaryImage product="${product}"
											format="product" />
									</div>
									<div class="carousel__item--name">${product.name}</div>
									<div class="carousel__item--price">
										<format:fromPrice priceData="${product.price}" />
									</div>
								</a>
							</div>

						</c:forEach>

					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</c:when>

	<c:otherwise>
		<component:emptyComponent />
	</c:otherwise>
</c:choose>

