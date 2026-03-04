import { useState, useRef, useEffect } from "react";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Calendar, MapPin, ChevronLeft, ChevronRight, Search, List, CalendarDays, CalendarIcon, ChevronUp } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

const MONTH_NAMES = [
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December",
];

const DAY_NAMES = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

interface EventData {
  id: number;
  title: string;
  date: string;
  year: number;
  month: number;
  day: number;
  location: string;
  tag: string;
}

const pastEvents: EventData[] = [
  {
    id: 1,
    title: "Vedam Nadam Organization Launch",
    date: "April 2, 2022",
    year: 2022,
    month: 3,
    day: 2,
    location: "Virtual (Zoom)",
    tag: "Launch",
  },
];

type ViewMode = "list" | "month" | "day";

function getDaysInMonth(year: number, month: number) {
  return new Date(year, month + 1, 0).getDate();
}

function getFirstDayOfMonth(year: number, month: number) {
  return new Date(year, month, 1).getDay();
}

function getEventsForDate(year: number, month: number, day: number) {
  return pastEvents.filter(e => e.year === year && e.month === month && e.day === day);
}

function getEventsForMonth(year: number, month: number) {
  return pastEvents.filter(e => e.year === year && e.month === month);
}

export default function EventsPage() {
  const today = new Date();
  const [viewMode, setViewMode] = useState<ViewMode>("list");
  const [currentMonth, setCurrentMonth] = useState(today.getMonth());
  const [currentYear, setCurrentYear] = useState(today.getFullYear());
  const [currentDay, setCurrentDay] = useState(today.getDate());
  const [searchQuery, setSearchQuery] = useState("");
  const [datePickerOpen, setDatePickerOpen] = useState(false);
  const [pickerYear, setPickerYear] = useState(currentYear);
  const datePickerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (datePickerRef.current && !datePickerRef.current.contains(e.target as Node)) {
        setDatePickerOpen(false);
      }
    }
    if (datePickerOpen) {
      document.addEventListener("mousedown", handleClickOutside);
    }
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [datePickerOpen]);

  function goToToday() {
    const now = new Date();
    setCurrentMonth(now.getMonth());
    setCurrentYear(now.getFullYear());
    setCurrentDay(now.getDate());
  }

  function goPrev() {
    if (viewMode === "month") {
      if (currentMonth === 0) {
        setCurrentMonth(11);
        setCurrentYear(currentYear - 1);
      } else {
        setCurrentMonth(currentMonth - 1);
      }
    } else if (viewMode === "day") {
      const d = new Date(currentYear, currentMonth, currentDay - 1);
      setCurrentYear(d.getFullYear());
      setCurrentMonth(d.getMonth());
      setCurrentDay(d.getDate());
    }
  }

  function goNext() {
    if (viewMode === "month") {
      if (currentMonth === 11) {
        setCurrentMonth(0);
        setCurrentYear(currentYear + 1);
      } else {
        setCurrentMonth(currentMonth + 1);
      }
    } else if (viewMode === "day") {
      const d = new Date(currentYear, currentMonth, currentDay + 1);
      setCurrentYear(d.getFullYear());
      setCurrentMonth(d.getMonth());
      setCurrentDay(d.getDate());
    }
  }

  const filteredEvents = searchQuery.trim()
    ? pastEvents.filter(e => e.title.toLowerCase().includes(searchQuery.toLowerCase()))
    : pastEvents;

  const daysInMonth = getDaysInMonth(currentYear, currentMonth);
  const firstDay = getFirstDayOfMonth(currentYear, currentMonth);

  return (
    <div className="mx-auto max-w-4xl px-4 py-8">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="text-center mb-8">
          <h1 className="text-3xl sm:text-4xl font-bold font-serif mb-3" data-testid="text-events-title">
            Events
          </h1>
        </div>

        <Card className="p-4 mb-6" data-testid="card-events-toolbar">
          <div className="flex flex-col sm:flex-row items-center justify-between gap-3">
            <div className="flex items-center gap-2">
              <Button
                variant="outline"
                size="sm"
                onClick={goToToday}
                data-testid="button-today"
              >
                Today
              </Button>
              {viewMode !== "list" && (
                <>
                  <Button size="icon" variant="ghost" onClick={goPrev} data-testid="button-prev">
                    <ChevronLeft className="h-4 w-4" />
                  </Button>
                  <Button size="icon" variant="ghost" onClick={goNext} data-testid="button-next">
                    <ChevronRight className="h-4 w-4" />
                  </Button>
                </>
              )}
              <div className="relative" ref={datePickerRef}>
                <button
                  className="flex items-center gap-1 text-sm font-semibold cursor-pointer hover:text-primary transition-colors"
                  onClick={() => { setPickerYear(currentYear); setDatePickerOpen(!datePickerOpen); }}
                  data-testid="button-date-picker"
                >
                  {viewMode === "day"
                    ? `${MONTH_NAMES[currentMonth]} ${currentDay}, ${currentYear}`
                    : `${MONTH_NAMES[currentMonth]} ${currentYear}`}
                  <ChevronUp className={`h-3.5 w-3.5 transition-transform ${datePickerOpen ? "" : "rotate-180"}`} />
                </button>

                <AnimatePresence>
                  {datePickerOpen && (
                    <motion.div
                      initial={{ opacity: 0, y: -4 }}
                      animate={{ opacity: 1, y: 0 }}
                      exit={{ opacity: 0, y: -4 }}
                      transition={{ duration: 0.15 }}
                      className="absolute top-full left-0 mt-2 z-50"
                    >
                      <Card className="p-4 w-72 shadow-lg">
                        <div className="flex items-center justify-between mb-4">
                          <Button
                            size="icon"
                            variant="ghost"
                            onClick={() => setPickerYear(pickerYear - 1)}
                            data-testid="button-picker-prev-year"
                          >
                            <ChevronLeft className="h-4 w-4" />
                          </Button>
                          <span className="text-sm font-semibold" data-testid="text-picker-year">{pickerYear}</span>
                          <Button
                            size="icon"
                            variant="ghost"
                            onClick={() => setPickerYear(pickerYear + 1)}
                            data-testid="button-picker-next-year"
                          >
                            <ChevronRight className="h-4 w-4" />
                          </Button>
                        </div>
                        <div className="grid grid-cols-4 gap-2">
                          {MONTH_NAMES.map((name, idx) => {
                            const isSelected = idx === currentMonth && pickerYear === currentYear;
                            return (
                              <Button
                                key={name}
                                variant={isSelected ? "default" : "ghost"}
                                size="sm"
                                className="text-xs"
                                onClick={() => {
                                  setCurrentMonth(idx);
                                  setCurrentYear(pickerYear);
                                  setDatePickerOpen(false);
                                  if (viewMode === "list") setViewMode("month");
                                }}
                                data-testid={`button-picker-month-${idx}`}
                              >
                                {name.slice(0, 3)}
                              </Button>
                            );
                          })}
                        </div>
                      </Card>
                    </motion.div>
                  )}
                </AnimatePresence>
              </div>
            </div>

            <div className="flex items-center gap-2">
              <form
                onSubmit={(e) => { e.preventDefault(); setViewMode("list"); }}
                className="flex items-center gap-1"
              >
                <Input
                  type="search"
                  placeholder="Search events"
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="w-40 sm:w-48"
                  data-testid="input-event-search"
                />
                <Button size="icon" variant="ghost" type="submit" data-testid="button-event-search">
                  <Search className="h-4 w-4" />
                </Button>
              </form>

              <div className="flex items-center border rounded-md">
                <Button
                  size="icon"
                  variant={viewMode === "list" ? "default" : "ghost"}
                  onClick={() => setViewMode("list")}
                  className="rounded-r-none"
                  data-testid="button-view-list"
                >
                  <List className="h-4 w-4" />
                </Button>
                <Button
                  size="icon"
                  variant={viewMode === "month" ? "default" : "ghost"}
                  onClick={() => setViewMode("month")}
                  className="rounded-none border-x"
                  data-testid="button-view-month"
                >
                  <CalendarDays className="h-4 w-4" />
                </Button>
                <Button
                  size="icon"
                  variant={viewMode === "day" ? "default" : "ghost"}
                  onClick={() => setViewMode("day")}
                  className="rounded-l-none"
                  data-testid="button-view-day"
                >
                  <CalendarIcon className="h-4 w-4" />
                </Button>
              </div>
            </div>
          </div>
        </Card>

        {viewMode === "list" && (
          <div>
            {filteredEvents.length === 0 ? (
              <Card className="p-6 text-center">
                <Calendar className="h-8 w-8 text-muted-foreground mx-auto mb-3 opacity-50" />
                <p className="text-sm text-muted-foreground" data-testid="text-no-events">
                  {searchQuery.trim() ? "No events match your search." : "0 events found."}
                </p>
              </Card>
            ) : (
              <div>
                <h2 className="text-lg font-semibold font-serif mb-4" data-testid="text-past-events">
                  Latest Past Events
                </h2>
                <div className="space-y-3">
                  {filteredEvents.map((event) => (
                    <Card key={event.id} className="p-5" data-testid={`card-event-${event.id}`}>
                      <div className="flex flex-col gap-3">
                        <div className="flex items-start justify-between gap-3 flex-wrap">
                          <div className="min-w-0 flex-1">
                            <h3 className="font-semibold text-base">{event.title}</h3>
                            <div className="flex items-center gap-3 mt-1.5 flex-wrap">
                              <span className="flex items-center gap-1.5 text-xs text-muted-foreground">
                                <Calendar className="h-3 w-3" />
                                {event.date}
                              </span>
                              <span className="flex items-center gap-1.5 text-xs text-muted-foreground">
                                <MapPin className="h-3 w-3" />
                                {event.location}
                              </span>
                            </div>
                          </div>
                          <Badge variant="secondary" className="text-[10px] shrink-0">{event.tag}</Badge>
                        </div>
                        {event.id === 1 && (
                          <div className="text-sm text-muted-foreground leading-relaxed space-y-2">
                            <p>Formally launching the Vedam Nadam organization on 2022 Ugadi auspicious day. Please join with your friends and family using the zoom link cited below.</p>
                            <div className="space-y-1">
                              <p><span className="font-semibold text-foreground">Zoom link:</span>{" "}
                                <a href="https://us06web.zoom.us/j/96170178434?pwd=cmdyMWRwbk9semM1emdTbGxWL2xMUT09" target="_blank" rel="noopener noreferrer" className="text-primary underline break-all">
                                  https://us06web.zoom.us/j/96170178434
                                </a>
                              </p>
                              <p><span className="font-semibold text-foreground">Meeting ID:</span> 961 7017 8434</p>
                              <p><span className="font-semibold text-foreground">Passcode:</span> 971868</p>
                            </div>
                            <div>
                              <p className="font-semibold text-foreground mb-1">Event Time:</p>
                              <ul className="list-disc list-inside space-y-0.5 pl-1">
                                <li>India – 8 pm</li>
                                <li>US Eastern – 10:30 am</li>
                                <li>US Central – 9:30 am</li>
                                <li>US Pacific – 7:30 am</li>
                              </ul>
                            </div>
                          </div>
                        )}
                      </div>
                    </Card>
                  ))}
                </div>
              </div>
            )}
          </div>
        )}

        {viewMode === "month" && (
          <Card className="p-4" data-testid="card-month-view">
            <div className="grid grid-cols-7 gap-px">
              {DAY_NAMES.map((day) => (
                <div key={day} className="p-2 text-center text-xs font-semibold text-muted-foreground">
                  {day}
                </div>
              ))}
              {Array.from({ length: firstDay }).map((_, i) => (
                <div key={`empty-${i}`} className="p-2 min-h-[4rem]" />
              ))}
              {Array.from({ length: daysInMonth }).map((_, i) => {
                const day = i + 1;
                const dayEvents = getEventsForDate(currentYear, currentMonth, day);
                const isToday = day === today.getDate() && currentMonth === today.getMonth() && currentYear === today.getFullYear();
                return (
                  <div
                    key={day}
                    className={`p-1.5 min-h-[4rem] border rounded-md cursor-pointer hover-elevate ${isToday ? "border-primary bg-primary/5" : "border-border/50"}`}
                    onClick={() => { setCurrentDay(day); setViewMode("day"); }}
                    data-testid={`cell-day-${day}`}
                  >
                    <span className={`text-xs ${isToday ? "font-bold text-primary" : "text-muted-foreground"}`}>
                      {day}
                    </span>
                    {dayEvents.map((ev) => (
                      <div key={ev.id} className="mt-1">
                        <Badge variant="default" className="text-[9px] w-full justify-start truncate">
                          {ev.title}
                        </Badge>
                      </div>
                    ))}
                  </div>
                );
              })}
            </div>
          </Card>
        )}

        {viewMode === "day" && (
          <Card className="p-6" data-testid="card-day-view">
            <h2 className="text-lg font-semibold font-serif mb-4">
              {MONTH_NAMES[currentMonth]} {currentDay}, {currentYear}
            </h2>
            {(() => {
              const dayEvents = getEventsForDate(currentYear, currentMonth, currentDay);
              if (dayEvents.length === 0) {
                return (
                  <div className="text-center py-8">
                    <Calendar className="h-8 w-8 text-muted-foreground mx-auto mb-3 opacity-50" />
                    <p className="text-sm text-muted-foreground">No events on this day.</p>
                  </div>
                );
              }
              return (
                <div className="space-y-3">
                  {dayEvents.map((event) => (
                    <div key={event.id} className="flex items-start gap-3">
                      <Badge variant="secondary" className="text-[10px] shrink-0 mt-0.5">{event.tag}</Badge>
                      <div>
                        <h3 className="font-semibold text-sm">{event.title}</h3>
                        <span className="flex items-center gap-1.5 text-xs text-muted-foreground mt-1">
                          <MapPin className="h-3 w-3" />
                          {event.location}
                        </span>
                      </div>
                    </div>
                  ))}
                </div>
              );
            })()}
          </Card>
        )}
      </motion.div>
    </div>
  );
}
