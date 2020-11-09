Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265A32ABCE5
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Nov 2020 14:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730481AbgKINlO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 9 Nov 2020 08:41:14 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:52638 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730631AbgKINjB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Nov 2020 08:39:01 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kc7Nr-0000EE-UK; Mon, 09 Nov 2020 13:38:59 +0000
From:   Colin Ian King <colin.king@canonical.com>
Subject: re: net: dsa: hellcreek: Add support for hardware timestamping
To:     Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        ivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Message-ID: <7c4b526c-b229-acdf-d22a-2bf4a206be5b@canonical.com>
Date:   Mon, 9 Nov 2020 13:38:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi

Static analysis on linux-next with Coverity has detected a potential
null pointer dereference issue on the following commit:

commit f0d4ba9eff75a79fccb7793f4d9f12303d458603
Author: Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>
Date:   Tue Nov 3 08:10:58 2020 +0100

    net: dsa: hellcreek: Add support for hardware timestamping

The analysis is as follows:

323                /* Get nanoseconds from ptp packet */
324                type = SKB_PTP_TYPE(skb);

   4. returned_null: ptp_parse_header returns NULL (checked 10 out of 12
times).
   5. var_assigned: Assigning: hdr = NULL return value from
ptp_parse_header.

325                hdr  = ptp_parse_header(skb, type);

   Dereference null return value (NULL_RETURNS)
   6. dereference: Dereferencing a pointer that might be NULL hdr when
calling hellcreek_get_reserved_field.

326                ns   = hellcreek_get_reserved_field(hdr);
327                hellcreek_clear_reserved_field(hdr);

This issue can only occur if the type & PTP_CLASS_PMASK is not one of
PTP_CLASS_IPV4, PTP_CLASS_IPV6 or PTP_CLASS_L2.  I'm not sure if this is
a possibility or not, but I'm assuming that it would be useful to
perform the null check just in case, but I'm not sure how this affects
the hw timestamping code in this function.

Colin


