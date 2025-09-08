import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { ArrowRight, Users, MapPin, MessageCircle } from "lucide-react";

const CTA = () => {
  return (
    <section className="py-24">
      <div className="container max-w-4xl mx-auto px-4">
        <Card className="relative overflow-hidden border-0 shadow-card-hover">
          <div className="absolute inset-0 bg-gradient-to-br from-primary/5 via-accent/5 to-primary/10" />
          
          <CardContent className="relative p-12 text-center">
            <div className="space-y-8">
              <div className="space-y-4">
                <h2 className="text-3xl md:text-4xl font-bold">
                  Ready to Transform Your
                  <span className="bg-gradient-to-r from-primary to-accent bg-clip-text text-transparent block">
                    Remote Work Experience?
                  </span>
                </h2>
                <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
                  Join thousands of freelancers and remote workers who are already building amazing connections and finding perfect work spots.
                </p>
              </div>

              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <Button size="lg" className="bg-primary-gradient hover:opacity-90 text-white">
                  Get Started Free
                  <ArrowRight className="ml-2 h-4 w-4" />
                </Button>
                <Button size="lg" variant="outline" className="border-primary text-primary hover:bg-primary/5">
                  Learn More
                </Button>
              </div>

              <div className="flex flex-col sm:flex-row items-center justify-center gap-8 pt-8">
                <div className="flex items-center gap-2">
                  <Users className="h-5 w-5 text-primary" />
                  <span className="text-sm text-muted-foreground">Free to join</span>
                </div>
                <div className="flex items-center gap-2">
                  <MapPin className="h-5 w-5 text-primary" />
                  <span className="text-sm text-muted-foreground">Verified locations</span>
                </div>
                <div className="flex items-center gap-2">
                  <MessageCircle className="h-5 w-5 text-primary" />
                  <span className="text-sm text-muted-foreground">Secure messaging</span>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </section>
  );
};

export default CTA;