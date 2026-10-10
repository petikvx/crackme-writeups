#!/usr/bin/env python3
"""dailycracking (flipflop) : mot de passe = "Crack" + jour du mois (%d)."""
import sys, datetime
d = datetime.date.fromisoformat(sys.argv[1]) if len(sys.argv) > 1 else datetime.date.today()
print("Crack%02d" % d.day)
