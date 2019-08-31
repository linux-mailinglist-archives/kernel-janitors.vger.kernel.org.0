Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C329A4409
	for <lists+kernel-janitors@lfdr.de>; Sat, 31 Aug 2019 12:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbfHaKa2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 31 Aug 2019 06:30:28 -0400
Received: from outbound.smtp.vt.edu ([198.82.183.121]:43168 "EHLO
        omr1.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726296AbfHaKa1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 31 Aug 2019 06:30:27 -0400
Received: from mr5.cc.vt.edu (mr5.cc.vt.edu [IPv6:2607:b400:92:8400:0:72:232:758b])
        by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x7VAUQVQ004503
        for <kernel-janitors@vger.kernel.org>; Sat, 31 Aug 2019 06:30:26 -0400
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
        by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x7VAULqT030784
        for <kernel-janitors@vger.kernel.org>; Sat, 31 Aug 2019 06:30:26 -0400
Received: by mail-qk1-f198.google.com with SMTP id f14so10056104qkm.15
        for <kernel-janitors@vger.kernel.org>; Sat, 31 Aug 2019 03:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=yS6lJBR0z5pXlUbR3vjtDfvuZ/ch4JHNsJdpqfM7yNY=;
        b=LpfQ6dshjSY/InRljdvvegKOGZ6KJB2NLidRpjD9cN/p8U7V42qjljPqBgqGrH9iQW
         VRAP7kePnGaO6LouKuc/IoXmhPZhM0gJhvWBX/WKd//FkpcMlNbXuyiqGmPdq1ig9IJ+
         bU3mxuyKp4OcLlyp9E17m+f8W3RZaV6x+iUDtMXIBFqa9Xcx29zH3KY6ZgDHish5DHHs
         /M0qPOP6y+5t0PzHnhpZCSor1vsZIKTg4B3mWZWgJp1l0NGKXJT1tqoWAHX/FWpyZeW2
         u+3y+b8hHr6WPBD9hoz79xAlucH5eD/Bug4r7jwsGKImUGvgWO88JYUcR/OCa+zJP2kX
         cD0A==
X-Gm-Message-State: APjAAAVPiDCsPQH0848U4xZXfztzgbvTp/m3CiHZJXHVde7p64hW7vT5
        L9vDDZn+lhGQRpmyh1zy9QYudCgp5wOPFuZMijB6iCMS7BrS1R+6lGUQ1Z/Em6ab46erXq9ALLq
        edZ0V6/lSp/rX9kp2SqwauparBEgUYcwQUu0yzLE=
X-Received: by 2002:a05:620a:1125:: with SMTP id p5mr4061531qkk.210.1567247421049;
        Sat, 31 Aug 2019 03:30:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuInrftSS9yb0sn0s1xQsaIUrlAnhCycOjV4outISe323Mo9dV6f7RRjcoGpIH/0dZSLvqtw==
X-Received: by 2002:a05:620a:1125:: with SMTP id p5mr4061511qkk.210.1567247420798;
        Sat, 31 Aug 2019 03:30:20 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:4340::ba0])
        by smtp.gmail.com with ESMTPSA id s17sm1979613qkm.54.2019.08.31.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2019 03:30:19 -0700 (PDT)
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Colin King <colin.king@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: exfat: remove redundant goto
In-Reply-To: <20190830181523.13356-1-colin.king@canonical.com>
References: <20190830181523.13356-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1567247418_4251P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Sat, 31 Aug 2019 06:30:18 -0400
Message-ID: <295459.1567247418@turing-police>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

--==_Exmh_1567247418_4251P
Content-Type: text/plain; charset=us-ascii

On Fri, 30 Aug 2019 19:15:23 +0100, Colin King said:
> From: Colin Ian King <colin.king@canonical.com>
>
> The goto after a return is never executed, so it is redundant and can
> be removed.
>
> Addresses-Coverity: ("Structurally dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch....

> -	if (dentry < -1) {
> +	if (dentry < -1)
>  		return FFS_NOTFOUND;
> -		goto out;
> -	}

But the wrong fix. The code *used* to have returns like this all over the
place, but that meant it returns with a lock held - whoops.  The *other* 287 or
so places I changed to 'ret = FFS_yaddayadda',  followed by a 'goto out' but I
apparently missed one.

And thanks a bunch for feeding it to Coverity :)



--==_Exmh_1567247418_4251P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXWpMOQdmEQWDXROgAQIm0w//aPU0Rv6gMxB2mP0p2L7LaEtmwIdoEwD9
ntgSn8am4fv/Zi99Y7BOBzCw5/KAyV8qo0V5LzIt4seIgXCa+I/gd12ngxmfRt1B
0HAjQQQZl5TX5l2gnAzTIlUasA6mnxkb27/9x+qSUZRwoCRSliQC4wsaNzHbDO0y
iSNdDeiRz9hqSHtim2p7OJG2DSMTzrahN5BYD58a78/ocgOGjokb4v1nSHkU2zIS
+3C1AhCU9K6o9RedPZ3aoLELlWfwXa6EWgtiMsNC28ay/b0LkJBiA8XelQkdlfmE
mXq+g51uNim/ZT5m2YZWx6znD/SjGbwBgmftA/oawZuw4REpvAHVihULK5SGVwNn
ClPsmzGIzLvlDeAE3NKnyMAZZ5/Ip49aLxjViJMAPKFhTOHpI8mKJFYjKja8DF/c
Bu16fZqvbm7Ux50iljUwc94NEVw1QDefd8PkTc3UgwInv54xpUvb5pckweHWe8bj
FANfoJKJWmYy2aDIHyww9Yj5obKJLazQTISnUZrpgP8b2HlvFolaLC/669sLd36v
Rdvz/nNh5bUL5vA8nojDQ+mSYMEy5zi38hRQdGnM45IW1K+GOquDRRTl3w82DNRF
TfuiZym2//hGZFaPD/tZuGLwmWcxN+5gvn6U5IPwaBHnDwYf4GgHmqh0G0PaOg5W
v4SY1xOsplg=
=O42f
-----END PGP SIGNATURE-----

--==_Exmh_1567247418_4251P--
