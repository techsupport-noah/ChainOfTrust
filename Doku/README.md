# Contract

Der Kontrakt wurde zunächst in mehrere subcontracts unterteilt, um das Lesen und schreiben voneinander zu trennen und einen Kontrakt zu erstellen, der komplett gas fee frei sein sollte. Allerdings wurde aufgrund von schwierigkeiten beim deployment alles in den Haupkontrakt übertragen.

Der Haupkontrakt Rating.sol kann von normalen Nutzern wiefolgt benutzt werden.

## createNewRating(address _to, uint8 _score)

Diese Funktion lässt das Wallet welches diese Funktion aufruft eine neue Bewertung für das Wallet _to anlegen.
Das Wallet darf _to dazu noch nicht bewertet haben und der _score muss einem der in _Valid festgelegten Gründen entsprechen.
Zudem muss das bewertende Wallet zu der Trusted User Gruppe gehören oder der Besitzer des Kontrakts sein.
Die Funktion erstellt dann einen neuen Datentypen und verlinkt diesen mit dem Bewerteten Wallet. Der gespeicherte Datensatz enthält die Bewertung und den Nutzer, der die Bewertung erstellt hat.

## scoreMessage(uint8 _score)

Mit dieser Funktion kann die Score Message, die in _Valid festgelegt ist abgefragt werden.

## addtrustedUser(address _user)

Mit dieser Funktion kann der Besitzer des Kontrakts anderen Wallets erlauben Bewertungen abzugeben, selbst wenn diese nicht die normalen Bedigungen für diese Aktion erfüllen.

## deltrustedUser(address _user)

Mit dieser Funktion kann der Besitzer des Kontracts anderen Wallets das recht enziehen Bewertungen abzugeben.

## get(address _user)

Diese Funktionen liefert die Bewertungen die dem _user gegeben wurden in einem Array mit der Anzahl zu den einzelnen Scores zurück.

## Other

Es gibt noch weitere Funktionen, die nicht außerhalb des Kontrakts benutzbar sind, wie _isScorevalid() die einfach Variablen überprüfen und dafür sorgen, dass bestimmte Funktionen nicht von jedem aufgerufen werden können.

## TrustedUsers

Ein Wallet gehört dieser Gruppe automatisch an, sobald es mehr als 10 Gute Bewertungen erhalten hat. Es kann nur von dem Kontrakt Besitzer wieder entfernt werden.

## Deployment

Leider haben wir keine vernünftigen Faucetes für das Goerli testnet gefunden. 
Wir hatten 0.07 ETH von unserem Professor erhalten, das reichte allerdings nicht für das Deployment des Kontrakts
Dieser kostete in der vollen Form viel zu viel, weshalb alles was nicht unbedingt gebraucht wurde und Funktionen die noch nicht ganz implementiert waren, wie das Bannen von Accounts raus gestrichen. Die Funktionen sind allerdings immernoch in den alten Kontrakts zu finden. Mitlerweile wurde der Hauptkontrakt Rating.sol so angepasst, dass dieser alle wichtigen Funktionen der anderen beinhaltet.

## Ban Idee

In dem alten Kontrakt ist noch die Funktionen zum Bannen von Wallets zu finden. Diese soll das Wallet davon abhalten neue Bewertungen zu erstellen, selbst wenn sie zu den Trusted Usern gehört. Zusätzlich soll diese eigenschaft eines Wallets alle bereits erstellten Bewertungen ungültig machen.
Aufgrund der Kosten zu deployen des Kontrakts wurde diese Funtkionen allerdings entfernt.