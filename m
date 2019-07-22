Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E4F70839
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jul 2019 20:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731206AbfGVSPI (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 22 Jul 2019 14:15:08 -0400
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:18879 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728594AbfGVSPI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Jul 2019 14:15:08 -0400
Received: from [192.168.1.41] ([92.140.204.221])
        by mwinf5d23 with ME
        id fuF22000X4n7eLC03uF3Zn; Mon, 22 Jul 2019 20:15:03 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 22 Jul 2019 20:15:03 +0200
X-ME-IP: 92.140.204.221
X-Mozilla-News-Host: news://news.gmane.org:119
To:     Kernel Janitors <kernel-janitors@vger.kernel.org>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Script to spot some typo based on the file name
Message-ID: <460fd687-474f-8a3e-82f6-269eb5507f96@wanadoo.fr>
Date:   Mon, 22 Jul 2019 20:15:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------A8F68BDB9A0462E4AC3DBAA1"
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------A8F68BDB9A0462E4AC3DBAA1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Attached is a WIP script I've just written which tries to spot typos in 
a file, based on the filename itself.

Yesterday, I've posted some finding done with this script.
Today, I share if someone finds it useful, want to improve it or just 
want to take the idea.

As, I'm not a bash guru, it is neither optimal, nor well written.
But it seems to work as I expect.


The name of a file can be a good source of information to spot typo in 
the code itself. This can help spot typo in comment or string, but also 
# wrongly named functions or constant.
3 checks are implemented. They can be disabled individually.

The filename should sometime be tweaked a bit to only take the part 
before or after a '-' or a '_'. (some regex pattern are in the script 
for that, just comment/un-comment)

The 2 last checks generate lot of false positives.
It can find some few things, but honestly, the semantic should be improved.


Just in case s.o. find it useful and want to use it to clean-up a few 
things.

Best regards

CJ


--------------A8F68BDB9A0462E4AC3DBAA1
Content-Type: text/plain; charset=UTF-8;
 name="script.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="script.sh"

IyEvYmluL2Jhc2gNCg0KIw0KIyBUaGUgbmFtZSBvZiBhIGZpbGUgY2FuIGJlIGEgZ29vZCBz
b3VyY2Ugb2YgaW5mb3JtYXRpb24gdG8gc3BvdCB0eXBvIGluDQojIHRoZSBjb2RlIGl0c2Vs
Zi4gVGhpcyBjYW4gaGVscCBzcG90IHR5cG8gaW4gY29tbWVudCBvciBzdHJpbmcsIGJ1dCBh
bHNvDQojIHdyb25nbHkgbmFtZWQgZnVuY3Rpb25zIG9yIGNvbnN0YW50DQojDQojIFRoaXMg
c2NyaXB0IGltcGxlbWVudHMgYSBmZXcgJ2dyZXAnIHdpdGggdmFyaWF0aW9ucyBvZiB0aGUg
ZmlsZW5hbWUNCiMgKGludmVyc2lvbiBvZiAyIGNoYXJzLCBtaXNzaW5nIGNoYXIsIHdyb25n
IGNoYXIpDQojDQoNCiMgRW5hYmxlL2Rpc2FibGUgZWFjaCB0ZXN0DQpkb19pbnZlcnNpb249
MTsNCmRvX21pc3Npbmc9MDsNCmRvX3dyb25nPTA7DQoNCg0KZm9yIGYgaW4gJChmaW5kIC4g
LW5hbWUgJyouYycgLXR5cGUgZik7IGRvDQogICAgIyBlY2hvICAkZjsNCiAgICANCiAgICBw
YXR0ZXJuPSQoYmFzZW5hbWUgJGYgLmMpDQogICAgI2VjaG8gICItICIgJHBhdHRlcm47DQog
ICAgDQogICAgIyBUaGlzIGNhbiBiZSB1c2VkIHRvIGV4dHJhY3Qgc3ViLXN0cmluZyBpbiB0
aGUgZmlsZW5hbWUNCiAgICAjIHBhcnQ9JChlY2hvICRwYXR0ZXJuIHwgcGVybCAtbHBlICdz
LyguKiktLiovJDEvJykNCiAgICAjIHBhcnQ9JChlY2hvICRwYXR0ZXJuIHwgcGVybCAtbHBl
ICdzLy4qLSguKikvJDEvJykNCiAgICBwYXJ0PSQoZWNobyAkcGF0dGVybikNCiAgICAjIGVj
aG8gICItLT4iICRwYXJ0ICIgKCIgJHsjcGFydH0gIikiIDsNCiAgICANCiAgICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjDQogICAgIyBDaGVjayBmb3IgY2hhciBpbnZlcnNpb24g
Iw0KICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCiAgICBmb3IgKCggbj0wOyBu
PCR7I3BhcnR9LTE7IG4rKyApKTsgZG8NCiAgICAgICAgeD0iJHtwYXJ0OiRuOjF9IjsNCiAg
ICAgICAgeT0iJHtwYXJ0OiRuKzE6MX0iOw0KICAgICAgICBmaXJzdD0iJHtwYXJ0OjE6MX0i
Ow0KICAgICAgICAjIGVjaG8gJHggIiAtICIgJHk7DQogICAgICAgIA0KICAgICAgICBpZiAo
KCRkb19pbnZlcnNpb249PTEpKSAmJiAoKCAkeyNwYXJ0fT41ICkpICYmIFsgIiR4IiAhPSAi
JHkiIF0gJiYgWyAiJGZpcnN0IiAhPSAiLSIgXTsgdGhlbg0KICAgICAgICAgICAgcGVybT0i
IjsNCg0KICAgICAgICAgICAgZm9yICgoIGk9MDsgaTxuOyBpKysgKSk7IGRvDQogICAgICAg
ICAgICAgICAgcGVybT0iJHBlcm0ke3BhcnQ6JGk6MX0iOw0KICAgICAgICAgICAgZG9uZQ0K
ICAgICAgICAgICAgcGVybT0iJHBlcm0ke3BhcnQ6JG4rMToxfSI7DQogICAgICAgICAgICBw
ZXJtPSIkcGVybSR7cGFydDokbjoxfSI7DQogICAgICAgICAgICBmb3IgKCggaT1uKzI7IGk8
JHsjcGFydH07IGkrKyApKTsgZG8NCiAgICAgICAgICAgICAgICBwZXJtPSIkcGVybSR7cGFy
dDokaToxfSI7DQogICAgICAgICAgICBkb25lDQoNCiAgICAgICAgICAgICMgZWNobyAtZSAk
cGVybSAiXG4iOw0KDQogICAgICAgICAgICAjIGVjaG8gImdyZXAgJHBlcm0gJGYiOw0KICAg
ICAgICAgICAgaWYgZ3JlcCAtaSAiJHBlcm0iICIkZiI7IHRoZW4NCiAgICAgICAgICAgICAg
ICBlY2hvIC1lICJcbiI7DQogICAgICAgICAgICAgICAgZWNobyAiZ3JlcCAtaSAkcGVybSAk
ZiI7DQogICAgICAgICAgICAgICAgZWNobyAgIiAgSW52ZXJzaW9uIC0tPiIgJHBhcnQgIiAo
IiAkeyNwYXJ0fSAiKSIgOw0KICAgICAgICAgICAgICAgIGVjaG8gIiMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMiOw0KICAgICAgICAgICAgICAgIGVjaG8gLWUgIlxuIjsNCiAgICAg
ICAgICAgIGZpDQogICAgICAgIGZpDQogICAgZG9uZQ0KDQogICAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMNCiAgICAjIENoZWNrIGZvciBtaXNzaW5nIGNoYXIgIw0KICAgICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjDQogICAgZm9yICgoIG49MTsgbjwkeyNwYXJ0fS0xOyBu
KysgKSk7IGRvDQogICAgICAgIA0KICAgICAgICBpZiAoKCRkb19taXNzaW5nPT0xKSkgJiYg
KCggJHsjcGFydH0+NSApKSAmJiBbICIke3BhcnQ6bjoxfSIgIT0gIl8iIF0gJiYgWyAiJHtw
YXJ0Om46MX0iICE9ICItIiBdICYmIFsgIiR7cGFydDpuOjF9IiAhPSAiJHtwYXJ0OjA6MX0i
IF0gJiYgWyAiJHtwYXJ0Om46MX0iICE9ICIke3BhcnQ6JHsjcGFydH0tMToxfSIgXTsgdGhl
bg0KICAgICAgICAgICAgcGVybT0iJHtwYXJ0OjA6bn0iOw0KICAgICAgICAgICAgcGVybT0i
JHBlcm0ke3BhcnQ6bisxOiR7I3BhcnR9fSI7DQoNCiAgICAgICAgICAgICMgZWNobyAtZSAk
cGVybSAiXG4iOw0KDQogICAgICAgICAgICAjIGVjaG8gImdyZXAgJHBlcm0gJGYiOw0KICAg
ICAgICAgICAgaWYgZ3JlcCAtaSAiJHBlcm0iICIkZiI7IHRoZW4NCiAgICAgICAgICAgICAg
ICBlY2hvIC1lICJcbiI7DQogICAgICAgICAgICAgICAgZWNobyAiZ3JlcCAtaSAkcGVybSAk
ZiI7DQogICAgICAgICAgICAgICAgZWNobyAgIiBNaXNzaW5nIC0tPiIgJHBhcnQgIiAoIiAk
eyNwYXJ0fSAiKSIgOw0KICAgICAgICAgICAgICAgIGVjaG8gIiMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMiOw0KICAgICAgICAgICAgICAgIGVjaG8gLWUgIlxuIjsNCiAgICAgICAg
ICAgIGZpDQogICAgICAgIGZpDQogICAgZG9uZQ0KDQogICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjDQogICAgIyBDaGVjayBmb3Igd3JvbmcgY2hhciAjDQogICAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjDQogICAgZm9yICgoIG49MTsgbjwkeyNwYXJ0fS0xOyBuKysgKSk7IGRv
DQogICAgICAgIA0KICAgICAgICBpZiAoKCRkb193cm9uZz09MSkpICYmICgoICR7I3BhcnR9
PjUgKSk7IHRoZW4NCiAgICAgICAgICAgIHBlcm09IiR7cGFydDowOm59IjsNCiAgICAgICAg
ICAgIHBlcm09IiRwZXJtW14gLV8ke3BhcnQ6bjoxfV0iOw0KICAgICAgICAgICAgcGVybT0i
JHBlcm0ke3BhcnQ6bisxOiR7I3BhcnR9fSI7DQoNCiAgICAgICAgICAgICMgZWNobyAtZSAk
cGVybSAiXG4iOw0KDQogICAgICAgICAgICAjIGVjaG8gImdyZXAgJHBlcm0gJGYiOw0KICAg
ICAgICAgICAgaWYgZ3JlcCAtaSAiJHBlcm0iICIkZiI7IHRoZW4NCiAgICAgICAgICAgICAg
ICBlY2hvIC1lICJcbiI7DQogICAgICAgICAgICAgICAgZWNobyAiZ3JlcCAtaSAkcGVybSAk
ZiI7DQogICAgICAgICAgICAgICAgZWNobyAgIiBXcm9uZyAtLT4iICRwYXJ0ICIgKCIgJHsj
cGFydH0gIikiIDsNCiAgICAgICAgICAgICAgICBlY2hvICIjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIjsNCiAgICAgICAgICAgICAgICBlY2hvIC1lICJcbiI7DQogICAgICAgICAg
ICBmaQ0KICAgICAgICBmaQ0KICAgIGRvbmUNCg0KZG9uZQ0K
--------------A8F68BDB9A0462E4AC3DBAA1--
