'use strict'
const app = require('koa')()
const logger = require('koa-logger')
const router = require('koa-router')()

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random#Getting_a_random_integer_between_two_values
function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min)) + min;
}

function delay(sec) {
	return new Promise(r => setTimeout(r, sec * 1000))
}

router.get('/deliveries', function* () {
	yield delay(getRandomInt(0, 5))
	if (!getRandomInt(0, 4)) {
		this.status = 500
		return
	}

	this.body = [
		{
			id: 1,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 2,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 3,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 4,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 5,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 6,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 7,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 8,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 9,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 10,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 11,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 12,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 13,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 14,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 15,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 16,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 17,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 18,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}, {
			id: 19,
			description: 'Deliver documents to Andrio',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg',
			location: {
				lat: 22.336093,
				lng: 114.155288,
				address: 'Cheung Sha Wan'
			}
		}, {
			id: 20,
			description: 'Deliver parcel to Leviero',
			imageUrl: 'http://placekitten.com.s3.amazonaws.com/homepage-samples/200/286.jpg',
			location: {
				lat: 22.319181,
				lng: 114.170008,
				address: 'Mong Kok'
			}
		}
	]
})
 
app
	.use(logger())
	.use(router.routes())
	.use(router.allowedMethods())

app.listen(8080)
console.log('Mock server started at port 8080')