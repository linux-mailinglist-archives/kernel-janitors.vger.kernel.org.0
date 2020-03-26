Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E150A194493
	for <lists+kernel-janitors@lfdr.de>; Thu, 26 Mar 2020 17:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbgCZQrv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 26 Mar 2020 12:47:51 -0400
Received: from smtprelay0003.hostedemail.com ([216.40.44.3]:41814 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726267AbgCZQru (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Mar 2020 12:47:50 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 1BFC818029121;
        Thu, 26 Mar 2020 16:47:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:982:983:988:989:1208:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1543:1593:1594:1605:1711:1730:1747:1777:1792:2197:2198:2199:2200:2393:2559:2562:2731:2828:2892:3138:3139:3140:3141:3142:3622:3653:3865:3866:3867:3868:3871:3874:4321:4605:5007:6119:6299:7875:7901:7903:8957:9010:9040:9405:10004:10226:10400:10848:11232:11658:11914:12043:12291:12296:12297:12555:12683:12740:12760:12895:13439:14181:14659:14721:21080:21221:21433:21451:21627:21740:21820:21939:30025:30046:30054:30060:30062:30070:30075:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: moon13_26d3129e62d05
X-Filterd-Recvd-Size: 4910
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Thu, 26 Mar 2020 16:47:46 +0000 (UTC)
Message-ID: <00d11cf766237d9c12c2a06458962c4bae84fa78.camel@perches.com>
Subject: Re: [PATCH] parse-maintainers: Do not sort section content by
 default
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 26 Mar 2020 09:45:55 -0700
In-Reply-To: <4d5291fa3fb4962b1fa55e8fd9ef421ef0c1b1e5.camel@perches.com>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com>
         <20200304131035.731a3947@lwn.net>
         <alpine.DEB.2.21.2003042145340.2698@felia>
         <e43f0cf0117fbfa8fe8c7e62538fd47a24b4657a.camel@perches.com>
         <alpine.DEB.2.21.2003062214500.5521@felia>
         <20200307110154.719572e4@onda.lan>
         <0d5503e1d864f2588e756ae590ff8935e11bf9d6.camel@perches.com>
         <4d5291fa3fb4962b1fa55e8fd9ef421ef0c1b1e5.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 2020-03-07 at 18:59 -0800, Joe Perches wrote:
> Add an --order switch to control section reordering.
> Default for --order is off.

> Change the default ordering to a slightly more sensible:
> 
> M:  Person acting as a maintainer
> R:  Person acting as a patch reviewer
> L:  Mailing list where patches should be sent
> S:  Maintenance status
> W:  URI for general information
> Q:  URI for patchwork tracking
> B:  URI for bug tracking/submission
> C:  URI for chat
> P:  URI or file for subsystem specific coding styles
> T:  SCM tree type and location
> F:  File and directory pattern
> X:  File and directory exclusion pattern
> N:  File glob
> K:  Keyword - patch content regex

Linus? ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  scripts/parse-maintainers.pl | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/parse-maintainers.pl b/scripts/parse-maintainers.pl
> index 255cef1..2ca4eb3 100644
> --- a/scripts/parse-maintainers.pl
> +++ b/scripts/parse-maintainers.pl
> @@ -8,13 +8,14 @@ my $input_file = "MAINTAINERS";
>  my $output_file = "MAINTAINERS.new";
>  my $output_section = "SECTION.new";
>  my $help = 0;
> -
> +my $order = 0;
>  my $P = $0;
>  
>  if (!GetOptions(
>  		'input=s' => \$input_file,
>  		'output=s' => \$output_file,
>  		'section=s' => \$output_section,
> +		'order!' => \$order,
>  		'h|help|usage' => \$help,
>  	    )) {
>      die "$P: invalid argument - use --help if necessary\n";
> @@ -32,6 +33,22 @@ usage: $P [options] <pattern matching regexes>
>    --input => MAINTAINERS file to read (default: MAINTAINERS)
>    --output => sorted MAINTAINERS file to write (default: MAINTAINERS.new)
>    --section => new sorted MAINTAINERS file to write to (default: SECTION.new)
> +  --order => Use the preferred section content output ordering (default: 0)
> +    Preferred ordering of section output is:
> +      M:  Person acting as a maintainer
> +      R:  Person acting as a patch reviewer
> +      L:  Mailing list where patches should be sent
> +      S:  Maintenance status
> +      W:  URI for general information
> +      Q:  URI for patchwork tracking
> +      B:  URI for bug tracking/submission
> +      C:  URI for chat
> +      P:  URI or file for subsystem specific coding styles
> +      T:  SCM tree type and location
> +      F:  File and directory pattern
> +      X:  File and directory exclusion pattern
> +      N:  File glob
> +      K:  Keyword - patch content regex
>  
>  If <pattern match regexes> exist, then the sections that match the
>  regexes are not written to the output file but are written to the
> @@ -56,7 +73,7 @@ sub by_category($$) {
>  
>  sub by_pattern($$) {
>      my ($a, $b) = @_;
> -    my $preferred_order = 'MRPLSWTQBCFXNK';
> +    my $preferred_order = 'MRLSWQBCPTFXNK';
>  
>      my $a1 = uc(substr($a, 0, 1));
>      my $b1 = uc(substr($b, 0, 1));
> @@ -105,8 +122,14 @@ sub alpha_output {
>  		print $file $separator;
>  	    }
>  	    print $file $key . "\n";
> -	    foreach my $pattern (sort by_pattern split('\n', %$hashref{$key})) {
> -		print $file ($pattern . "\n");
> +	    if ($order) {
> +		foreach my $pattern (sort by_pattern split('\n', %$hashref{$key})) {
> +		    print $file ($pattern . "\n");
> +		}
> +	    } else {
> +		foreach my $pattern (split('\n', %$hashref{$key})) {
> +		    print $file ($pattern . "\n");
> +		}
>  	    }
>  	}
>      }
> 

