#!/usr/bin/env julia
using StatsBase

# The number of syllables per word you want to generate: #
sylnum = 2
# The number of words you want to generate: #
outputlines = 3000

# Function for random choice: #
function random(chars, weights)
	rng = MersenneTwister(1234)
	normWeights = ProbabilityWeights([w/sum(weights) for w in weights])
	choice = sample(rng, chars, wv::normWeights)
	return choice
end

# Writes a wordlist output file: #
open("output.txt", "w") do f
	# Do this as many times as the number of words you want in the output: #
	for i in 1:outputlines
		# Do this for each syllable: #
		for j in 1:sylnum
			if j == 1
				oldsyl = ""
			syl = ""
			end
			# Generate nucleus: #
			vowels = ["a", "e", "i", "o", "u"] 
			vowelweights = [38.56, 13.96, 19.13, 13.11, 15.24]
			nuc = random(vowels, vowelweights)
			# Generate onset: #
			# First syllable: #
			if oldsyl == ""
				onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
				onsc1weights = [17.69, 9.09, 5.25, 0.87, 4.67, 7.44, 10.00, 0.82, 5.69, 4.35, 3.50, 1.90, 4.48, 1.03, 1.14, 2.77, 4.43, 2.07, 2.78, 2.49, 3.68]
				onsc1 = random(onsc1, onsc1weights)
			end
			# After first syllable: #
			if oldsyl != ""
				if oldsyl[1] == "p" | oldsyl[1] == "b" | oldsyl[1] == "f"
					onsc1= ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [10.29, 6.55, 8.62, 1.05, 0.3, 9.25, 7.36, 1.64, 0.48, 2.89, 3.72, 0.17, 4.20, 0.64, 0.97, 1.33, 9.27, 9.65, 2.25, 2.18, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				elseif oldsyl[1] == "t" | oldsyl[1] == "d" | oldsyl[1] == "s"
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [9.47, 6.55, 8.62, 1.05, 3.05, 0.93, 7.36, 1.64, 4.81, 0.29, 3.72, 1.67, 0.42, 0.64, 0.97, 1.33, 9.27, 9.65, 2.25, 2.18, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				elseif oldsyl[1] == "k" | oldsyl[1] == "g"
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [10.11, 6.55, 8.62, 1.05, 3.05, 9.25, 0.74, 1.64, 4.81, 2.89, 0.37, 1.67, 4.20, 0.64, 0.97, 1.33, 9.27, 9.65, 2.25, 2.18, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				elseif oldsyl[1] == "m" | oldsyl[1] == "n"
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [9.49, 0.66, 0.86, 0.11, 3.05, 9.25, 7.36, 1.64, 4.81, 2.89, 3.72, 1.67, 4.20, 0.64, 0.97, 1.33, 9.27, 9.65, 2.25, 2.18, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				elseif oldsyl[1] == "l" | oldsyl[1] == "r"
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [9.16, 6.55, 8.62, 1.05, 3.05, 9.25, 7.36, 1.64, 4.81, 2.89, 3.72, 1.67, 4.20, 0.64, 0.97, 1.33, 0.93, 0.97, 2.25, 2.18, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				elseif oldsyl[1] == "z" | oldsyl[1] == "x" | oldsyl[1] == "c"
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [11.09, 6.55, 8.62, 1.05, 3.05, 9.25, 7.36, 1.64, 4.81, 2.89, 3.72, 1.67, 4.20, 0.06, 0.09, 0.13, 9.27, 9.65, 2.25, 2.18, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				elseif oldsyl[1] == "h" | oldsyl[1] == "`"
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [10.78, 6.55, 8.62, 1.05, 3.05, 9.25, 7.36, 0.16, 4.81, 2.89, 3.72, 1.67, 4.20, 0.64, 0.97, 1.33, 9.27, 9.65, 2.25, 2.18, 0.39]
					onsc1 = random(onsc1, onsc1weights)
				elseif oldsyl[1] == "w" | oldsyl[1] == "y"
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [10.92, 6.55, 8.62, 1.05, 3.05, 9.25, 7.36, 1.64, 4.81, 2.89, 3.72, 1.67, 4.20, 0.64, 0.97, 1.33, 9.27, 9.65, 0.22, 0.22, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				else
					onsc1 = ["", "m", "n", "ny", "p", "t", "k", "`", "b", "d", "g", "f", "s", "z", "x", "c", "l", "r", "y", "w", "h"]
					onsc1weights = [11.45, 6.55, 8.62, 1.05, 3.05, 9.25, 7.36, 1.64, 4.81, 2.89, 3.72, 1.67, 4.20, 0.64, 0.97, 1.33, 9.27, 9.65, 2.25, 2.18, 3.93]
					onsc1 = random(onsc1, onsc1weights)
				end
			end
			# Generate coda: #
			# Before penultimate syllable: #
			if j < sylnum-1
				if length(oldsyl) > 2
					if oldsyl[3] == "m" | oldsyl[3] == "n" | oldsyl[3] == "ng"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [201.68, 0.66, 2.12, 0.74, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "p"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [317.44, 6.63, 21.18, 7.38, 0.3, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "t"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [297.64, 6.63, 21.18, 7.38, 3.03, 0.85, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "k"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [298.08, 6.63, 21.18, 7.38, 3.03, 8.53, 0.84, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "s"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [314.96, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 0.37, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "l" | oldsyl[3] == "r"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [277.24, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 0.7, 0.72, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "y" | oldsyl[3] == "w"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [295.96, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 0.65, 0.26]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					else
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [328.36, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					end
				else
					coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
					codaweights = [328.36, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
					coda = random(coda, codaweights)
					if nuc[1] !in("a", "e") & coda[1] in("y", "w")
						coda[1] = ""
					end
				end
			end
			# Penultimate syllable: #
			if j == sylnum-1
				if length(oldsyl) > 2
					if oldsyl[3] == "m" | oldsyl[3] == "n" | oldsyl[3] == "ng"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [117.65, 0.66, 2.12, 0.74, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "p"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [185.17, 6.63, 21.18, 7.38, 0.3, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "t"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [173.62, 6.63, 21.18, 7.38, 3.03, 0.85, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "k"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [173.88, 6.63, 21.18, 7.38, 3.03, 8.53, 0.84, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "s"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [183.73, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 0.37, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "l" | oldsyl[3] == "r"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [161.72, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 0.7, 0.72, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "y" | oldsyl[3] == "w"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [172.64, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 0.65, 0.26]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					else
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [191.54, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					end
				else
					coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
					codaweights = [191.54, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
					coda = random(coda, codaweights)
					if nuc[1] !in("a", "e") & coda[1] in("y", "w")
						coda[1] = ""
					end
				end
			end
			# Final syllable: #
			if j == sylnum
				if length(oldsyl) > 2
					if oldsyl[3] == "m" | oldsyl[3] == "n" | oldsyl[3] == "ng"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [89.25, 0.66, 2.12, 0.74, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "p"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [140.45, 6.63, 21.18, 7.38, 0.3, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "t"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [131.71, 6.63, 21.18, 7.38, 3.03, 0.85, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "k"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [131.9, 6.63, 21.18, 7.38, 3.03, 8.53, 0.84, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "s"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [139.38, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 0.37, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "l" | oldsyl[3] == "r"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [122.68, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 0.7, 0.72, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					elseif oldsyl[3] == "y" | oldsyl[3] == "w"
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [130.97, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 0.65, 0.26]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					else
						coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
						codaweights = [145.3, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
						coda = random(coda, codaweights)
						if nuc[1] !in("a", "e") & coda[1] in("y", "w")
							coda[1] = ""
						end
					end
				else
					coda = ["", "m", "n", "ng", "p", "t", "k", "s", "l", "r", "y", "w"]
					codaweights = [145.3, 6.63, 21.18, 7.38, 3.03, 8.53, 8.41, 3.72, 7.03, 7.17, 6.46, 2.55]
					coda = random(coda, codaweights)
					if nuc[1] !in("a", "e") & coda[1] in("y", "w")
						coda[1] = ""
					end
				end
			end
			# Write to output file: ##
			syl = syl * onsc1[1] * nuc[1] * coda[1] * "."
			oldsyl = syl
			write(f, syl)
		end
		write(f, "\n")
	end
end
