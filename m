Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3FCACFA2
	for <lists+kernel-janitors@lfdr.de>; Sun,  8 Sep 2019 18:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbfIHQLX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 8 Sep 2019 12:11:23 -0400
Received: from correo.us.es ([193.147.175.20]:51102 "EHLO mail.us.es"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729355AbfIHQLX (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Sep 2019 12:11:23 -0400
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
        by mail.us.es (Postfix) with ESMTP id 8AC35EBAC5
        for <kernel-janitors@vger.kernel.org>; Sun,  8 Sep 2019 18:11:19 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id 7C695B7FF2
        for <kernel-janitors@vger.kernel.org>; Sun,  8 Sep 2019 18:11:19 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
        id 62ED5D2B1F; Sun,  8 Sep 2019 18:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on antivirus1-rhel7.int
X-Spam-Level: 
X-Spam-Status: No, score=-108.2 required=7.5 tests=ALL_TRUSTED,BAYES_50,
        SMTPAUTH_US2,USER_IN_WHITELIST autolearn=disabled version=3.4.1
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id 58EF3DA72F;
        Sun,  8 Sep 2019 18:11:17 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
 by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int);
 Sun, 08 Sep 2019 18:11:17 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (sys.soleta.eu [212.170.55.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: 1984lsi)
        by entrada.int (Postfix) with ESMTPSA id 343B84251480;
        Sun,  8 Sep 2019 18:11:17 +0200 (CEST)
Date:   Sun, 8 Sep 2019 18:11:18 +0200
X-SMTPAUTHUS: auth mail.us.es
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Fernando Fernandez Mancera <ffmancera@riseup.net>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] netfilter: nf_tables: Fix an Oops in nf_tables_updobj()
 error handling
Message-ID: <20190908161118.hfvcmrqsxyyxogyj@salvia>
References: <20190906081808.GA8281@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906081808.GA8281@mwanda>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 06, 2019 at 11:18:08AM +0300, Dan Carpenter wrote:
> The "newobj" is an error pointer so we can't pass it to kfree().  It
> doesn't need to be freed so we can remove that and I also renamed the
> error label.

Applied, thanks.
