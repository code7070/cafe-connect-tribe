import { Button } from "@/components/ui/button";
import { ArrowRight, MapPin, Users, Zap } from "lucide-react";
import heroImage from "@/assets/hero-collaboration.jpg";

const Hero = () => {
  return (
    <section className="relative min-h-[80vh] flex items-center justify-center overflow-hidden">
      {/* Background Image */}
      <div className="absolute inset-0 z-0">
        <img 
          src={heroImage} 
          alt="Remote workers collaborating in a modern cafe"
          className="w-full h-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-r from-background/95 via-background/60 to-background/30" />
      </div>
      
      {/* Content */}
      <div className="relative z-10 container max-w-6xl mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-12 items-center">
          <div className="space-y-8">
            <div className="space-y-4">
              <h1 className="text-4xl md:text-6xl font-bold leading-tight">
                Find Your Perfect
                <span className="bg-gradient-to-r from-primary to-accent bg-clip-text text-transparent block">
                  Work Companion
                </span>
              </h1>
              <p className="text-lg md:text-xl text-muted-foreground max-w-lg">
                Connect with freelancers and remote workers. Discover amazing cafes and co-working spaces. Build your productivity network today.
              </p>
            </div>
            
            <div className="flex flex-col sm:flex-row gap-4">
              <Button size="lg" className="bg-primary-gradient hover:opacity-90 text-white">
                Start Connecting
                <ArrowRight className="ml-2 h-4 w-4" />
              </Button>
              <Button size="lg" variant="outline" className="border-primary text-primary hover:bg-primary/5">
                Explore Locations
                <MapPin className="ml-2 h-4 w-4" />
              </Button>
            </div>
            
            <div className="flex items-center gap-8 pt-4">
              <div className="flex items-center gap-2">
                <div className="bg-accent/10 p-2 rounded-lg">
                  <Users className="h-5 w-5 text-accent-foreground" />
                </div>
                <div>
                  <div className="font-semibold text-sm">500+ Members</div>
                  <div className="text-xs text-muted-foreground">Active Community</div>
                </div>
              </div>
              
              <div className="flex items-center gap-2">
                <div className="bg-primary/10 p-2 rounded-lg">
                  <MapPin className="h-5 w-5 text-primary" />
                </div>
                <div>
                  <div className="font-semibold text-sm">50+ Locations</div>
                  <div className="text-xs text-muted-foreground">Verified Venues</div>
                </div>
              </div>
              
              <div className="flex items-center gap-2">
                <div className="bg-accent/10 p-2 rounded-lg">
                  <Zap className="h-5 w-5 text-accent-foreground" />
                </div>
                <div>
                  <div className="font-semibold text-sm">AI Powered</div>
                  <div className="text-xs text-muted-foreground">Smart Matching</div>
                </div>
              </div>
            </div>
          </div>
          
          {/* Feature Preview Cards */}
          <div className="hidden lg:block space-y-4">
            <div className="bg-card/80 backdrop-blur p-6 rounded-xl shadow-card border">
              <h3 className="font-semibold mb-2">Create Work Sessions</h3>
              <p className="text-sm text-muted-foreground">Announce your WFC/WFA plans and invite others to join your productive sessions.</p>
            </div>
            <div className="bg-card/80 backdrop-blur p-6 rounded-xl shadow-card border ml-8">
              <h3 className="font-semibold mb-2">AI Recommendations</h3>
              <p className="text-sm text-muted-foreground">Get personalized location and companion suggestions based on your preferences.</p>
            </div>
            <div className="bg-card/80 backdrop-blur p-6 rounded-xl shadow-card border">
              <h3 className="font-semibold mb-2">Group Collaboration</h3>
              <p className="text-sm text-muted-foreground">Connect through group chats and build lasting professional relationships.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;