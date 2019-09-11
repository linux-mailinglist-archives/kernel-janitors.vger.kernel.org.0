Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C5CB02C6
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 19:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbfIKRiJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 13:38:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33886 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbfIKRiJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 13:38:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id r12so14175901pfh.1
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2019 10:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HFNs3VIOJF+/jkI2zxc/LRnDhLyxHsi8ph6smCt7L+Q=;
        b=VUHggKfeiF4j3v+totu3C0Tp7d/fJ/jAEC1zdOH7PL668WlWcKvhipruHzLbs4m+Nc
         JrUBAYQo1bupDyEFXf3aRwA+XlLmxsmtF7saY1i7SSP02eCix58F3yxnteuMR7xiwEO3
         dlvjmP/WbmTkoVpDNNJN+y3fpkYc04i5Y2s5DNw+KeDkgJkeHOB6tkdA1BSFbk4r30UO
         yhQBG6VM4Ee2YONhlhaEdGtp0LLEm6Gfv5HwYbHVMJAMU8LVssO9ajHs8ZZq9dWE5kSV
         jMDAB2kSEseAea2r7G2jf7hKcr9/i0TlRtqbXbsWlrmxPBYjxOGkeVNbxodBaRnt0e8U
         hhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HFNs3VIOJF+/jkI2zxc/LRnDhLyxHsi8ph6smCt7L+Q=;
        b=N9qCA7Suih5lRxA/fWy4ywOjnYVd6T/azt6+ZWSpyoD/ZUkbebTa2uUUT6bS7AXdHy
         JtYOpUvgI/s913/sqsTIOZl/57R/cILaFnaUDTFq73XKzkSuBGzp4O6wouuJQfrBW02H
         FGfrRrw3zkhgRlyJuW6ieq3hkGgxF8yPEtF2crUPqEq1aejuIHz28oTNuNm/A6qMkR2b
         IxKBrIXlrSMO3dw5l9bSFh/t6loFJoFIJxiet75NyVzBd9ScE9D6R0ZnJKdi69DVO1MG
         n9++K19RucmZt+QJmCkZ0QBq4SY6b7UVpHIId0Bm/uGUut/b6CQ1tkz4cHjI1PzDFCqF
         u76g==
X-Gm-Message-State: APjAAAUa0vc6r8kVvE/YiyOGJdLfzBhc43OnSK6fSkD5L0pemJUMZRrQ
        13VgjaKirkx+6/UTglXKF4aTSpXMJrA0Pw==
X-Google-Smtp-Source: APXvYqzhAECrRcZjqz2bn2C1j+nqBdtUB7K77PGTq3g0XPCgVmWcXukcaaW21a/0sx9XIIxonXpeIg==
X-Received: by 2002:a63:d64f:: with SMTP id d15mr34892141pgj.345.1568223488521;
        Wed, 11 Sep 2019 10:38:08 -0700 (PDT)
Received: from SARKAR ([1.186.12.73])
        by smtp.gmail.com with ESMTPSA id 207sm29076441pfu.129.2019.09.11.10.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 10:38:08 -0700 (PDT)
Date:   Wed, 11 Sep 2019 23:08:03 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org,
        Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>,
        Eric Anholt <eric@anholt.net>,
        linux-rpi-kernel@lists.infradead.org,
        Dominic Braun <inf.braun@fau.de>
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-ID: <20190911173803.GA19183@SARKAR>
References: <20190911135112.GA5569@SARKAR>
 <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
 <20190911142543.GA9873@SARKAR>
 <20190911144312.GL15977@kadam>
 <20190911150300.GA12027@SARKAR>
 <20190911172422.GK20699@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911172422.GK20699@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 11, 2019 at 08:24:22PM +0300, Dan Carpenter wrote:
> On Wed, Sep 11, 2019 at 08:33:00PM +0530, Rohit Sarkar wrote:
> > There are a lot of usages of "snprintf" throughout the staging
> > directory (315 to be exact)
> > Would it be worthwhile to find ones that may cause an information leak
> > and replace them with "scnprintf"?
> 
> A lot of times it's really easy to see that the uses are safe, so
> snprintf() is fine in that case.  If it's not obviously safe then change
> it.
> 
> regards,
> dan carpenter
> 

Sure, thanks a ton!
regards,
Rohit
