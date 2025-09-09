import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { MapPin, Star, Users, ArrowLeft, Navigation, ExternalLink } from "lucide-react";
import { supabase } from "@/integrations/supabase/client";
import { useToast } from "@/hooks/use-toast";

interface Place {
  id: string;
  name: string;
  description: string;
  address: string;
  city: string;
  location: any;
  rating: number;
  price_range: string;
  amenities: string[];
  signature_menus: string[];
  visitor_photos: string[];
  image_url: string;
}

const DiscoverPlaces = () => {
  const [places, setPlaces] = useState<Place[]>([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [isLoading, setIsLoading] = useState(true);
  const [userLocation, setUserLocation] = useState<string>("");
  const [locationPermission, setLocationPermission] = useState<string>("prompt");
  const navigate = useNavigate();
  const { toast } = useToast();
  const placesPerPage = 5;

  useEffect(() => {
    fetchPlaces();
    checkLocationPermission();
  }, []);

  const fetchPlaces = async () => {
    try {
      const { data, error } = await supabase
        .from("places")
        .select("*")
        .range((currentPage - 1) * placesPerPage, currentPage * placesPerPage - 1);

      if (error) {
        toast({
          title: "Error",
          description: "Failed to fetch places",
          variant: "destructive",
        });
      } else {
        setPlaces(data || []);
      }
    } catch (error) {
      console.error("Error fetching places:", error);
    } finally {
      setIsLoading(false);
    }
  };

  const checkLocationPermission = async () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          setLocationPermission("granted");
          setUserLocation(`${position.coords.latitude}, ${position.coords.longitude}`);
        },
        (error) => {
          console.error("Location error:", error);
          setLocationPermission("denied");
        }
      );
    } else {
      setLocationPermission("denied");
    }
  };

  const requestLocation = () => {
    checkLocationPermission();
  };

  const openInGoogleMaps = (place: Place) => {
    const query = encodeURIComponent(`${place.name} ${place.address}`);
    window.open(`https://www.google.com/maps/search/?api=1&query=${query}`, "_blank");
  };

  const loadMorePlaces = () => {
    setCurrentPage(prev => prev + 1);
    setIsLoading(true);
    fetchPlaces();
  };

  const getPriceRangeColor = (priceRange: string) => {
    switch (priceRange) {
      case "low": return "bg-green-500";
      case "medium": return "bg-yellow-500";
      case "high": return "bg-red-500";
      default: return "bg-gray-500";
    }
  };

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto p-4">
        <div className="flex items-center justify-between mb-6">
          <Button
            variant="ghost"
            onClick={() => navigate("/")}
            className="text-muted-foreground hover:text-foreground"
          >
            <ArrowLeft className="w-4 h-4 mr-2" />
            Back to Home
          </Button>
        </div>

        <div className="mb-8">
          <h1 className="text-3xl font-bold mb-4">Discover Places</h1>
          
          {/* Current Location Section */}
          <Card className="mb-6 shadow-card">
            <CardContent className="pt-6">
              <div className="flex items-center gap-3">
                <MapPin className="w-5 h-5 text-primary" />
                <div className="flex-1">
                  {locationPermission === "granted" ? (
                    <div>
                      <p className="font-medium">Current Location</p>
                      <p className="text-sm text-muted-foreground">{userLocation}</p>
                    </div>
                  ) : (
                    <div>
                      <p className="font-medium">Location Access Needed</p>
                      <p className="text-sm text-muted-foreground">
                        Allow location access to find places near you
                      </p>
                    </div>
                  )}
                </div>
                {locationPermission !== "granted" && (
                  <Button onClick={requestLocation} variant="outline" size="sm">
                    <Navigation className="w-4 h-4 mr-2" />
                    Enable Location
                  </Button>
                )}
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Places List */}
        <div className="space-y-6">
          {isLoading && places.length === 0 ? (
            <div className="text-center py-8">
              <p className="text-muted-foreground">Loading places...</p>
            </div>
          ) : (
            places.map((place) => (
              <Card key={place.id} className="shadow-card hover:shadow-card-hover transition-all">
                <CardHeader>
                  <div className="flex justify-between items-start">
                    <div>
                      <CardTitle className="text-xl">{place.name}</CardTitle>
                      <CardDescription className="mt-1">
                        {place.address}, {place.city}
                      </CardDescription>
                    </div>
                    <div className="flex items-center gap-2">
                      <Star className="w-4 h-4 fill-yellow-400 text-yellow-400" />
                      <span className="font-medium">{place.rating}</span>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4">
                  {/* Image */}
                  {place.image_url && (
                    <div className="w-full h-48 rounded-lg overflow-hidden">
                      <img
                        src={place.image_url}
                        alt={place.name}
                        className="w-full h-full object-cover"
                      />
                    </div>
                  )}

                  {/* Description */}
                  <p className="text-muted-foreground">{place.description}</p>

                  {/* Price Range */}
                  <div className="flex items-center gap-2">
                    <span className="text-sm font-medium">Price Range:</span>
                    <Badge className={`${getPriceRangeColor(place.price_range)} text-white`}>
                      {place.price_range.toUpperCase()}
                    </Badge>
                  </div>

                  {/* Signature Menus */}
                  {place.signature_menus && place.signature_menus.length > 0 && (
                    <div>
                      <h4 className="font-medium mb-2">Signature Menu:</h4>
                      <div className="flex flex-wrap gap-2">
                        {place.signature_menus.slice(0, 3).map((menu, index) => (
                          <Badge key={index} variant="secondary">
                            {menu}
                          </Badge>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Amenities */}
                  {place.amenities && place.amenities.length > 0 && (
                    <div>
                      <h4 className="font-medium mb-2">Amenities:</h4>
                      <div className="flex flex-wrap gap-2">
                        {place.amenities.slice(0, 4).map((amenity, index) => (
                          <Badge key={index} variant="outline">
                            {amenity}
                          </Badge>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Visitor Photos (as avatars) */}
                  {place.visitor_photos && place.visitor_photos.length > 0 && (
                    <div>
                      <h4 className="font-medium mb-2">Recent Visitors:</h4>
                      <div className="flex items-center gap-2">
                        <Users className="w-4 h-4 text-muted-foreground" />
                        <div className="flex -space-x-2">
                          {place.visitor_photos.slice(0, 5).map((photo, index) => (
                            <Avatar key={index} className="w-8 h-8 border-2 border-background">
                              <AvatarImage src={photo} alt={`Visitor ${index + 1}`} />
                              <AvatarFallback>V{index + 1}</AvatarFallback>
                            </Avatar>
                          ))}
                        </div>
                      </div>
                    </div>
                  )}

                  {/* Actions */}
                  <div className="flex gap-3 pt-4">
                    <Button
                      onClick={() => openInGoogleMaps(place)}
                      className="bg-primary-gradient hover:opacity-90"
                    >
                      <ExternalLink className="w-4 h-4 mr-2" />
                      Open in Google Maps
                    </Button>
                  </div>
                </CardContent>
              </Card>
            ))
          )}

          {/* Load More Button */}
          {places.length > 0 && places.length % placesPerPage === 0 && (
            <div className="text-center pt-6">
              <Button
                onClick={loadMorePlaces}
                variant="outline"
                disabled={isLoading}
                className="hover:bg-primary hover:text-primary-foreground"
              >
                {isLoading ? "Loading..." : "Load More Places"}
              </Button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default DiscoverPlaces;