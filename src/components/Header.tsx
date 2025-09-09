import { Button } from "@/components/ui/button";
import { MapPin, Users, MessageCircle, Calendar } from "lucide-react";
import { useNavigate } from "react-router-dom";

const Header = () => {
  const navigate = useNavigate();

  return (
    <header className="sticky top-0 z-50 w-full border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
      <div className="container flex h-16 items-center justify-between">
        <div className="flex items-center space-x-2 cursor-pointer" onClick={() => navigate("/")}>
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary-gradient">
            <Users className="h-4 w-4 text-white" />
          </div>
          <span className="text-xl font-bold text-foreground">WorkMate</span>
        </div>
        
        <nav className="hidden md:flex items-center space-x-8">
          <button 
            onClick={() => navigate("/discover")}
            className="flex items-center space-x-2 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
          >
            <MapPin className="h-4 w-4" />
            <span>Discover Places</span>
          </button>
          <a href="#" className="flex items-center space-x-2 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
            <Calendar className="h-4 w-4" />
            <span>Events</span>
          </a>
          <a href="#" className="flex items-center space-x-2 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
            <MessageCircle className="h-4 w-4" />
            <span>Community</span>
          </a>
        </nav>

        <div className="flex items-center space-x-4">
          <Button variant="ghost" size="sm" onClick={() => navigate("/auth")}>
            Sign In
          </Button>
          <Button variant="default" size="sm" className="bg-primary-gradient hover:opacity-90" onClick={() => navigate("/discover")}>
            Get Started
          </Button>
        </div>
      </div>
    </header>
  );
};

export default Header;