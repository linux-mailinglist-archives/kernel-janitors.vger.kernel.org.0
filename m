Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA33D19B92
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 May 2019 12:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfEJKZa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 10 May 2019 06:25:30 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43621 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbfEJKZa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 10 May 2019 06:25:30 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hP2iV-0001HQ-Pr; Fri, 10 May 2019 12:25:27 +0200
Message-ID: <1557483927.7859.3.camel@pengutronix.de>
Subject: Re: [PATCH][V2] reset: remove redundant null check on pointer dev
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Date:   Fri, 10 May 2019 12:25:27 +0200
In-Reply-To: <CAMpxmJWyVZ2hHE=1tu5NgSzEHZKD2pBo8KUXg1CLUaB-WX4KHQ@mail.gmail.com>
References: <20190510095832.28233-1-colin.king@canonical.com>
         <CAMpxmJWyVZ2hHE=1tu5NgSzEHZKD2pBo8KUXg1CLUaB-WX4KHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2019-05-10 at 12:14 +0200, Bartosz Golaszewski wrote:
> pt., 10 maj 2019 o 11:58 Colin King <colin.king@canonical.com> napisał(a):
> > 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Pointer dev is being dereferenced when passed to the inlined
> > functon dev_name, however, dev is later being null checked
> > so at first this seems like a potential null pointer dereference.
> > 
> > In fact, _reset_control_get_from_lookup is only ever called from
> > __reset_control_get, right after checking dev->of_node hence
> > dev can never be null.  Clean this up by removing the redundant
> > null check.
> > 
> > Thanks to Philipp Zabel for spotting that dev can never be null.
> > 
> > Addresses-Coverity: ("Dereference before null check")
> > Fixes: 6691dffab0ab ("reset: add support for non-DT systems")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thank you both, applied to reset/fixes.

regards
Philipp
