import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { 
  MapPin, 
  Users, 
  MessageCircle, 
  Calendar, 
  Brain, 
  Shield,
  Smartphone,
  Zap
} from "lucide-react";

const Features = () => {
  const features = [
    {
      icon: Users,
      title: "Smart Matching",
      description: "Connect with like-minded remote workers and freelancers based on skills, interests, and work style.",
      badge: "AI Powered"
    },
    {
      icon: MapPin,
      title: "Location Discovery",
      description: "Find the perfect cafes, co-working spaces, and venues for your work sessions with detailed reviews.",
      badge: "500+ Venues"
    },
    {
      icon: Calendar,
      title: "Work Sessions",
      description: "Create and join WFC/WFA announcements to coordinate productive work sessions with others.",
      badge: "Easy Planning"
    },
    {
      icon: MessageCircle,
      title: "Group Chat",
      description: "Communicate with your work companions through secure group chats and direct messaging.",
      badge: "Real-time"
    },
    {
      icon: Brain,
      title: "AI Recommendations",
      description: "Get personalized suggestions for locations and work partners based on your preferences and history.",
      badge: "Personalized"
    },
    {
      icon: Shield,
      title: "Secure & Private",
      description: "Your data is encrypted and protected. Control your privacy settings and who can connect with you.",
      badge: "Enterprise Grade"
    }
  ];

  return (
    <section className="py-24 bg-secondary/30">
      <div className="container max-w-6xl mx-auto px-4">
        <div className="text-center space-y-4 mb-16">
          <h2 className="text-3xl md:text-4xl font-bold">
            Everything You Need to 
            <span className="bg-gradient-to-r from-primary to-accent bg-clip-text text-transparent block">
              Work Together
            </span>
          </h2>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            From finding the perfect work spot to connecting with amazing people, our platform has all the tools you need for successful remote collaboration.
          </p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {features.map((feature, index) => (
            <Card key={index} className="group hover:shadow-card-hover transition-all duration-300 border-0 bg-card/50 backdrop-blur">
              <CardContent className="p-6">
                <div className="space-y-4">
                  <div className="flex items-start justify-between">
                    <div className="bg-primary/10 p-3 rounded-lg group-hover:bg-primary/20 transition-colors">
                      <feature.icon className="h-6 w-6 text-primary" />
                    </div>
                    <Badge variant="secondary" className="text-xs">
                      {feature.badge}
                    </Badge>
                  </div>
                  
                  <div>
                    <h3 className="font-semibold text-lg mb-2">{feature.title}</h3>
                    <p className="text-sm text-muted-foreground leading-relaxed">
                      {feature.description}
                    </p>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Mobile & Responsive Section */}
        <div className="mt-16 text-center">
          <div className="inline-flex items-center gap-2 bg-accent/10 px-4 py-2 rounded-full mb-4">
            <Smartphone className="h-4 w-4 text-accent-foreground" />
            <span className="text-sm font-medium">Mobile Optimized</span>
          </div>
          <h3 className="text-2xl font-bold mb-2">Work From Anywhere, On Any Device</h3>
          <p className="text-muted-foreground max-w-lg mx-auto">
            Our platform is fully responsive and optimized for mobile, tablet, and desktop. Take your work network with you wherever you go.
          </p>
        </div>
      </div>
    </section>
  );
};

export default Features;