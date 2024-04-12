package util

import (
	clpp "github.com/TheThingsNetwork/go-cayenne-lib"
	"math"
	"math/rand"
)

func roundFloat(val float64, precision uint) float64 {
	ratio := math.Pow(10, float64(precision))
	return math.Round(val*ratio) / ratio
}

func aroundM(val float64) float64 {
	return roundFloat(val-0.05+float64(rand.Intn(100))*0.001, 3)
}

func aroundC(val float64) float64 {
	return roundFloat(val-0.5+float64(rand.Intn(100))*0.01, 2)
}

func aroundD(val float64) float64 {
	return roundFloat(val-5.0+float64(rand.Intn(100))*0.1, 1)
}

func CayennePayload() []byte {
	e := clpp.NewEncoder()

	e.AddTemperature(0, aroundC(15.0))
	e.AddRelativeHumidity(1, aroundC(49.0))
	e.AddBarometricPressure(2, aroundD(1035.0))
	e.AddAccelerometer(3, aroundM(0.0), aroundM(0.0), aroundM(0.0))

	return e.Bytes()
}
